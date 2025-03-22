import 'package:flutter/foundation.dart' show immutable;

enum Gender { male, female }

@immutable
class Person {
  final String fullName;
  final int age;
  final Gender gender;

  const Person({
    required this.fullName,
    required this.age,
    required this.gender,
  });

  @override
  String toString() {
    return 'Person{fullName: $fullName, age: $age, gender: $gender}';
  }
}

final List<Person> people = [
  Person(fullName: "David Williams", age: 34, gender: Gender.male),
  Person(fullName: "Emily Johnson", age: 18, gender: Gender.female),
  Person(fullName: "Michael Davis", age: 28, gender: Gender.male)
];
