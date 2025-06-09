// secenekler.dart
import 'package:flutter/material.dart';

class Secenekler {
  final String isim;
  final String resimYolu;

  Secenekler({required this.isim, required this.resimYolu});
}

List<Secenekler> secenekler = [
  Secenekler(isim: 'Taş', resimYolu: 'assets/tas.png'),
  Secenekler(isim: 'Kağıt', resimYolu: 'assets/kagit.png'),
  Secenekler(isim: 'Makas', resimYolu: 'assets/makas.png'),
];
