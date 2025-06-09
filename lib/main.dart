import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/ana_sayfa.dart';

void main(){
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  const AnaUygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}
