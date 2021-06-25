import 'package:gsheets/gsheets.dart';

import 'event.dart';

// These secrets could be decompiled from the app, but the threat is not significant.
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "itinerary-317819",
  "private_key_id": "0c638d5d32060024b2b62814e67002e6458714f3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCwljxCegzvUjlO\nUleFHVs+kHIEu+oMBSuj+/EBCEwjR180pg+B4msV9nCMyKJma/hEpp2muz0sJ8uX\nDHkgy9HES2aMlCJdPXy7M3ZT9kAIPqXMlLd0BFsJuDB9c2vKrZxHdiSXDHvdx3cT\nzkliQ+h/voeKJyaDuP8q6T6cWm3hYkW1t6hpG8JUBf5Xg2Q6DNqecJSqh0P90Bpy\nHhahaJWNfy1xIVoHeWVr55y+umYAxSTDi56bLHk54dOAToKyWLk9iu+GYU3FUPlk\nZxo2f0CwhPRXc+YVCUntKz382F+/u25iTAF7U2xrV58JVU1uY9NTATGgH/oOjiYH\np187Vhb9AgMBAAECggEAIqnfGtqMCveMRb5erUP5uxKOOzUrCKCENEy6vq3jCkLS\nospdPW0VgcpuRgiFbo8PvWQqisXzCGWobpZ1eZVg8EQv1XUnuL9e6n174xfx8lxf\n3gSsbWMEfugv5pRfaroBNTrxDFCYSQ0EaDgkihxT+a2MPDeatR09w63lCzqqGqWF\nFUFCnaUh4WEC2xmhSJNBtHeI9oUzm1bEtJ0K2CC6C86OW3Fj2FbvV6Kug5wEMJaG\nAyq8LqoEEI3qOGHszwflEeuOeD7MuhMGQnzHBZZ1uKj62yUjSadoCOjaKOG7GIpw\nTVDFXmErLfwMfpPHexhc81QIzg6crSXxF36g7N5UYQKBgQDZCzN37cr9Ao2OzW3M\nXn62KHrE/HqyvCPFXKAljpdeMWr3QLsdC8HK/9QTrlteS2g0QOlT3QczV5TS4Ex6\nlfkEMiCrOA9CwyqBChagALb3tM1ulMBQjbxSdN4y0Z+DBGKGcBvyKKlQplp5OH/d\ny3DxJrWgJ6Hj+l1aSDW5SgkHnQKBgQDQSBt4wMTq8A4u+Ul/ehPZtuRWB3anOX89\nVNtBaKG5F74anlkmD0SIG8CNXIPyh0v7tv05mLS+Ho5vmkn5U5Xi2LqeGH9TEkYQ\nSfnszt5K5rL9d65d6LbIWhnZ6IlhYBppCvxfZRSg4g/tmkOpjliaX1ZYl3FPqtdW\nr68rKeoe4QKBgE2te5MdcLuSUVVdYkF1REYvQJkFf2g+e1LkLpCicrwMVar96Lmh\nfo8HdkBA84RQ2o9w99DC1xPh8WpzSgvJZuDAi/6bRqLvNGQQVz6WYuVOOQOtixKJ\nV2/vUaLAcSUzyYsxzl6hfM9XaiPeO60GZXp5DyGtbXwpG4X3N/sDay3lAoGBAMYs\nFZdrMvGmvpgLMNdNvB1mWxNPvqGVn28nkgZGG7oU0RhamdAQrtAiN69I23KjMLSr\ng3yNw0sxn6yoTMIhuXdBZy6NeHf95xQQju+2VONHZf6tJQbNKTywHfCrxCsWWYqg\nnUfW0S3Saf1UzhRCECOxmmJolbOLhaBBQJX9J3mBAoGBAI5RdmNHdz4HOZcG0Ns5\nR8EanpiWnFBj6qIFo64rY41M+407I/uvxxQd49yRW1+81sFUuqu3HG6ia0H5WfZI\nWkQrPwPCHcZ7PArYxEFoRVTaEDe7mOZhkCwidz+WBgQawqwEWuOPFjHP94vjA0NC\nftcVZyjSgN0Xx7R6s0eDzmV0\n-----END PRIVATE KEY-----\n",
  "client_email": "sheets@itinerary-317819.iam.gserviceaccount.com",
  "client_id": "106751606847998430073",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sheets%40itinerary-317819.iam.gserviceaccount.com"
}''';

const _spreadsheetId = '1S1Gbl0kquhip9juZYyVyGhMtpGthRy6H17oQJ7Q9OOw';

class GoogleSheet {
  static DateTime convertFromGoogleSheetsTime(String value) {
    final daysSinceEpoch = double.parse(value);
    final epochStart = DateTime(1899, 12, 30);

    return epochStart
        .add(Duration(minutes: (daysSinceEpoch * 24 * 60).toInt()));
  }

  static Future<List<Event>> getItinerary() async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    final sheet = ss.worksheetByTitle('Sheet1');
    final allRows = await sheet?.cells.allRows(fromRow: 2); // skip headers

    final itinerary = <Event>[];

    if (allRows != null) {
      for (final row in allRows..removeAt(0)) {
        try {
          DateTime startDate = DateTime(1980, 1, 1);
          DateTime endDate = DateTime(1980, 1, 1);
          Category category = Category.other;
          String eventName = '';
          String location = '';
          Uri? url;
          String notes = '';
          for (final col in row) {
            switch (col.column) {
              case 1:
                startDate = convertFromGoogleSheetsTime(col.value);
                print(startDate);
                break;
              case 2:
                endDate = convertFromGoogleSheetsTime(col.value);
                break;
              case 3:
                category = CategoryHelper.fromString(col.value);
                break;
              case 4:
                eventName = col.value;
                break;
              case 5:
                location = col.value;
                break;
              case 6:
                url = Uri.parse(col.value);
                break;
              case 7:
                notes = col.value;
                break;
              default:
            }
          }
          final event = Event(
              startDate, endDate, category, eventName, location, url, notes);
          itinerary.add(event);
        } on FormatException {
          print('unable to parse row.');
        }
      }
    }

    return itinerary;
  }
}

void main() async {
  final itinerary = await GoogleSheet.getItinerary();
  print(itinerary.length);
}
