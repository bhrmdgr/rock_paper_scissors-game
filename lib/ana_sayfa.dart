import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/iki_kisi_game.dart';
import 'package:rock_paper_scissors/tek_kisi_game.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),


    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Text(
        "Taş-Kağıt-Makas",
        style: TextStyle(
          fontSize: 24
        ),
      ),
      backgroundColor: Colors.yellowAccent,
      elevation: 5,
    );
  }

  Widget _buildBody(){
    return Column(
      children: [
        SizedBox(height: 50,),
        Image.asset("assets/tkm.png"),
        SizedBox(height: 150,),
        _buildColumnRow(),
      ],
    );
  }

  Widget _buildColumnRow(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: Text(
                "Tek Kişilik Oyun"
            ),
            onPressed: (){
              _tekKisiOyna(context);
            }),
        SizedBox(height:25,),
        ElevatedButton(
            child: Text(
                "İki Kişilik Oyun"
            ),
            onPressed: (){
              _ikiKisiOyna(context);
            }),
      ],
    );
  }

  void _tekKisiOyna(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context){
          return TekKisiGame();
        }
    );
    Navigator.push(context, sayfaYolu);

  }

  void _ikiKisiOyna(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context){
          return IkiKisiGame();
        }
    );
    Navigator.push(context, sayfaYolu);


  }
}
