import 'dart:math';

class Person {
  String? name;
  int? age;
  List<int> randomNumbers = [];

  Person() {
    name = "no name";
    age = 1;
    Random r = Random();
    for (int i = 0; i < 3; i += 1) {
      randomNumbers.add(r.nextInt(11));
    }
  }
}
