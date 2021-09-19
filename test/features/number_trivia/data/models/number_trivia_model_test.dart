import 'dart:convert';

import 'package:flutter_tdd_clean/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_tdd_clean/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      //assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when the json number is an integer',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('trivia.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tNumberTriviaModel));
        },
      );

      test(
        'should return a valid model when the json number is regarded as a double',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('trivia_double.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tNumberTriviaModel));
        },
      );
    },
  );

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tNumberTriviaModel.toJson();
        // assert
        final expectedMap = {
          "text": "Test text",
          "number": 1,
        };
        expect(result, expectedMap);
      },
    );
  });
}
