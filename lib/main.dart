import 'package:flutter/foundation.dart';

void main() {
  if (kDebugMode) {
    print(add(''));
    print(add('1'));
    print(add('1,1'));
    print(add('1\n22,4'));
    print(add('//;\n1;7'));
  }
}

int add(String numbers) {
  //Handle Empty String
  if (numbers.isEmpty) {
    return 0;
  }
  // Check if there is a custom delimiter
  if (numbers.startsWith('//')) {
    int delimiterEnd = numbers.indexOf('\n');
    String delimiter = numbers.substring(2, delimiterEnd);
    numbers = numbers.substring(delimiterEnd + 1);

    // Replace custom delimiter with commas
    numbers = numbers.replaceAll(delimiter, ',');
  } else {
    numbers = numbers.replaceAll('\n', ','); // Replace newlines with commas
  }

  //Handle Comma-Separated Numbers
  List<String> numberList = numbers.split(',');
  //add all numbers of numberList
  return numberList.fold(0, (sum, number) => sum + int.parse(number));
}
