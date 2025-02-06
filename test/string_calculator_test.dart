import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_tdd_app/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string returns 0', () {
    expect(calculator.add(""), 0);
  });

  test('Single number returns its value', () {
    expect(calculator.add("1"), 1);
  });

  test('Two numbers return their sum', () {
    expect(calculator.add("1,2"), 3);
  });

  test('Multiple numbers return their sum', () {
    expect(calculator.add("1,2,3,4"), 10);
  });

  test('Supports new line as delimiter', () {
    expect(calculator.add("1\n2,3"), 6);
  });

  test('Supports custom delimiter', () {
    expect(calculator.add("//;\n1;2"), 3);
  });

  test('Throws exception for negative numbers', () {
    expect(
        () => calculator.add("1,-2,3,-4"),
        throwsA(predicate((e) =>
            e.toString().contains("Negative numbers not allowed: -2, -4"))));
  });
}
