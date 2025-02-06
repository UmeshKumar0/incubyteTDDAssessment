class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0; // Step 1: Handle empty input

    String delimiter = ',|\n'; // Default delimiters: comma or newline
    if (numbers.startsWith('//')) {
      // Step 6: Handle custom delimiter
      int delimiterEndIndex = numbers.indexOf('\n');
      delimiter = RegExp.escape(numbers.substring(2, delimiterEndIndex));
      numbers = numbers.substring(delimiterEndIndex + 1);
    }

    // Step 3: Split numbers based on delimiter(s)
    final numList = numbers.split(RegExp(delimiter)).where((n) => n.isNotEmpty);

    List<int> parsedNumbers = [];
    List<int> negativeNumbers = [];

    for (var num in numList) {
      int parsedNum = int.tryParse(num) ?? 0;
      if (parsedNum < 0) {
        negativeNumbers.add(parsedNum);
      }
      parsedNumbers.add(parsedNum);
    }

    if (negativeNumbers.isNotEmpty) {
      // Step 7: Throw an exception for negative numbers
      throw Exception("Negative numbers not allowed: ${negativeNumbers.join(', ')}");
    }

    return parsedNumbers.reduce((a, b) => a + b);
  }
}
