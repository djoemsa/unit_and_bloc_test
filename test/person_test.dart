import 'dart:math';

import 'package:test/test.dart';
import 'package:flutter_testing/person.dart';

void main() {
  group('Checking Class Person', () {
    Person p = Person();

    setUp(() {
      print('di jalankan di awal');
    });

    tearDown(() {
      print('di jalankan saat sebuah test selesai');
    });

    test('Inisialisasi objek person', () {
      expect(p.name, equals("no name"));
      expect(p.age, equals(1));
    });

    test('Cek apakah age positif?', () {
      p.age = 10;
      expect(p.age, isPositive);
    });

    test('Cek apakah age negatif?', () {
      p.age = -10;
      expect(p.age, isNegative);
    });

    test('ke-3 angka pada list randomNumbers ber bentuk Positif', () {
      expect(p.randomNumbers,
          allOf([hasLength(equals(3)), isNot(anyElement(isNegative))]));
    });
  });
}
