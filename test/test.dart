import 'dart:convert';

import 'package:account_book/data/model/trade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String str = '';
  print(str.isNotEmpty);
}

void decodeTest() {
  group('test', () {
    test('test', () async {

      String jsonStr = '''
  {
    "fruits": ["apple", "banana", "cherry"],
    "numbers": [1, 2, 3, 4]
  }
  ''';

      Map<String, dynamic> parsedJson = json.decode(jsonStr);

      Map<String, List<dynamic>> resultMap = {};

      parsedJson.forEach((key, value) {
        if (value is List) {
          resultMap[key] = value.cast<dynamic>(); // List<dynamic>으로 변환
        }
      });

      print(resultMap);
    });
  });
}
