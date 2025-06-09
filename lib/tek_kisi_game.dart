import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/secenekler.dart';
import 'package:rock_paper_scissors/tek_kisi_oyun_ekrani.dart';
import 'dart:math';

class TekKisiGame extends StatefulWidget {
  const TekKisiGame({super.key});

  @override
  State<TekKisiGame> createState() => _TekKisiGameState();
}

class _TekKisiGameState extends State<TekKisiGame> {
  List<Secenekler> _butunSecenekler = [];

  Secenekler? kullaniciSecimi;
  Secenekler? bilgisayarSecimi;

  @override
  void initState() {
    super.initState();
    _butunSecenekler = secenekler;// secenekler listesini burada atıyoruz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.yellowAccent,
      title: Text(
        "Birini Seç",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Center(
          child: Text(
            "Tek Bir Seçim Hakkınız Var!!",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // İki sütunlu grid görünümü
              childAspectRatio: 0.7, // Kartların yüksekliğini belirlemek için
            ),
            itemCount: _butunSecenekler.length,
            itemBuilder: _buildGridItem,
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    Secenekler secenek = _butunSecenekler[index];

    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              secenek.resimYolu,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 8),
          Text(secenek.isim),
        ],
      ),
      onTap: (){
        _buildCardTiklandi(context, index);

      },
    );
  }
  
  void _buildCardTiklandi(BuildContext context, int index){
    Secenekler secenek = _butunSecenekler[index];
    kullaniciSecimi = secenek;
    bilgisayarSecimi = _rastgeleSecim();
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => TekKisiOyunEkrani(
      kullaniciSecimi :kullaniciSecimi,
      bilgisayarSecimi : bilgisayarSecimi,
    ),
    ),
    );


  }

  Secenekler  _rastgeleSecim() {
    final random = Random();
    final index = random.nextInt(_butunSecenekler.length); // Rastgele bir indeks seç
    return _butunSecenekler[index]; // Rastgele seçilen kartı döndür
  }
  
}
