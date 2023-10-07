// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:my_flutter_app/main.dart';
class Human {
  String name = '';
  int age = 0;

  Human(this.name, this.age);

  String info() {
    return 'name: $name, age: $age';
  }
}

// student
class Student extends Human {
  final String school;

  Student(super.name, super.age, {required this.school});

  @override
  String info() {
    String info = '${super.info()} school: $school';
    return info;
  }
}

void main() {
  // double a = 4.5;
  // double b = 3.5;
  // double c = 10.2;

  // double avg = (a + b + c) / 3;
  // print(avg);

  // String text1 = 'hello';
  // String text2 = 'word';
  // print('${text1}_$text2');

  // bool enable = false;
  // double height = 4.5;
  // bool isOver = height > 1.2;

  // print('$enable $isOver');

  // double getAvg(double a, double b) {
  //   return a * b;
  // }

  // print(getAvg(3.5, 6.4));

  // double bmi({required double a, double b = 30}) {
  //   return a * b;
  // }

  // print(bmi(a: 30.5));

  // Human zs = Human('张三', 99);

  // print(zs.info());

  // Student ls = Student('李四', 20, school: '安徽师范大学');

  // print(ls.info());

  List<int> numList = [1, 2, 34];

  print(numList);

  Set<int> numSet = {1, 9, 4};

  for (int value in numSet) {
    print('num: $value');
  }

  Map<int, String> mapList = {0: 'aaa', 1: 'bbb', 2: 'ccc'};

  mapList.forEach((key, value) {
    print('key: $key, value: $value');
  });
}
