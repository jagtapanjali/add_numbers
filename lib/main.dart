import 'package:flutter/foundation.dart';

void main() {
  if (kDebugMode) {
    print(add(''));
  }
}

int add(String numbers) {
  ///Handle Empty String
  if (numbers.isEmpty) {
    return 0;
  }
  return int.parse(numbers);  // convert string to int
}
