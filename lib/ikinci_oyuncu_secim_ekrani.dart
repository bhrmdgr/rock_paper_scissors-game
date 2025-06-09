import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/iki_kisi_game.dart';
import 'package:rock_paper_scissors/iki_kisi_oyun_ekrani.dart';
import 'package:rock_paper_scissors/secenekler.dart';

class IkinciOyuncuSecimEkrani extends StatefulWidget {
  final String birinciOyuncuIsim;
  final String ikinciOyuncuIsim;
  final Secenekler? birinciOyuncuSecimi;

  const IkinciOyuncuSecimEkrani({
    Key? key,
    required this.birinciOyuncuIsim,
    required this.ikinciOyuncuIsim,
    this.birinciOyuncuSecimi,
  }) : super(key: key);

  @override
  State<IkinciOyuncuSecimEkrani> createState() => _IkinciOyuncuSecimEkraniState();
}

class _IkinciOyuncuSecimEkraniState extends State<IkinciOyuncuSecimEkrani> {
  List<Secenekler> _butunSecenekler = [];
  Secenekler? ikinciOyuncuSecimi;

  @override
  void initState() {
    super.initState();
    _butunSecenekler = secenekler; // secenekler listesini burada atıyoruz
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
            widget.ikinciOyuncuIsim,
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
      onTap: () {
        _buildCardTiklandi(context, index);
      },
    );
  }

  void _buildCardTiklandi(BuildContext context, int index) {
    Secenekler secenek = _butunSecenekler[index];
    ikinciOyuncuSecimi = secenek;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IkiKisiOyunEkrani(
          birinciOyuncuIsim: widget.birinciOyuncuIsim,
          ikinciOyuncuIsim: widget.ikinciOyuncuIsim,
          birinciOyuncuSecimi: widget.birinciOyuncuSecimi,
          ikinciOyuncuSecimi: ikinciOyuncuSecimi,
        ),
      ),
    );
  }
}
