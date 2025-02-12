import 'package:flutter/foundation.dart';

void main() {
  if (kDebugMode) {
    print(add(''));
    print(add('1'));
    print(add('1,1'));
  }
}

int add(String numbers) {
  //Handle Empty String
  if (numbers.isEmpty) {
    return 0;
  }
  //Handle Comma-Separated Numbers
  List<String> numberList = numbers.split(',');
  //add all numbers of numberList
  return numberList.fold(0, (sum, num) => sum + int.parse(num));
}
