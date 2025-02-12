import 'package:flutter/foundation.dart';

void main() {
  if (kDebugMode) {
    print(add(''));
    print(add('1'));
    print(add('1,1'));
    print(add('1\n22,4'));
    print(add('//;\n1;7'));
    //print(add('-2'));
    //print(add('1,-1'));
    //print(add('1\n-22,4'));
    print(add('//;\n1;7;'));
    print(add('1,2,'));
    print(add('//;\n-1;7;-3'));
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

  //handle negative numbers
  List<String> negativeNumbers = [];
  for (var num in numberList) {
    //handling if string input ends with delimiter
    if(num.isNotEmpty) {
      int parsedNum = int.parse(num);
      //check if number is negative
      if (parsedNum < 0) {
        negativeNumbers.add(num);
      }
    }
  }

  if (negativeNumbers.isNotEmpty) {
    //throw error with join of negativeNumbers
    throw FormatException('Negative numbers not allowed: ${negativeNumbers.join(',')}');
  }

  //add all numbers of numberList
  return numberList.fold(0, (sum, number) {
    //handling if string input ends with delimiter
    if(number.isEmpty) {
      number = '0';
    }
    return sum + int.parse(number);
  });
}
