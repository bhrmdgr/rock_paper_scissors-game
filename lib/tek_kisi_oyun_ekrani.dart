import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/ana_sayfa.dart';
import 'package:rock_paper_scissors/secenekler.dart';
import 'package:rock_paper_scissors/tek_kisi_game.dart';

class TekKisiOyunEkrani extends StatefulWidget {
  final Secenekler? kullaniciSecimi;
  final Secenekler? bilgisayarSecimi;

  const TekKisiOyunEkrani({Key? key, this.kullaniciSecimi, this.bilgisayarSecimi}) : super(key: key);

  @override
  State<TekKisiOyunEkrani> createState() => _TekKisiOyunEkraniState();
}

class _TekKisiOyunEkraniState extends State<TekKisiOyunEkrani> {
  @override
  Widget build(BuildContext context) {
    // Sonucu hesapla
    String sonuc;
    if (widget.kullaniciSecimi?.isim == widget.bilgisayarSecimi?.isim) {
      sonuc = "Berabere";
    } else if (widget.kullaniciSecimi?.isim == "Taş" &&
        widget.bilgisayarSecimi?.isim == "Kağıt") {
      sonuc = "Rakip Kazandı";
    } else if (widget.kullaniciSecimi?.isim == "Taş" &&
        widget.bilgisayarSecimi?.isim == "Makas") {
      sonuc = "Sen Kazandın";
    } else if (widget.kullaniciSecimi?.isim == "Kağıt" &&
        widget.bilgisayarSecimi?.isim == "Taş") {
      sonuc = "Sen Kazandın";
    } else if (widget.kullaniciSecimi?.isim == "Kağıt" &&
        widget.bilgisayarSecimi?.isim == "Makas") {
      sonuc = "Rakip Kazandı";
    } else if (widget.kullaniciSecimi?.isim == "Makas" &&
        widget.bilgisayarSecimi?.isim == "Taş") {
      sonuc = "Rakip Kazandı";
    } else if (widget.kullaniciSecimi?.isim == "Makas" &&
        widget.bilgisayarSecimi?.isim == "Kağıt") {
      sonuc = "Sen Kazandın";
    } else {
      sonuc = "Sonuç";
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(sonuc),
      backgroundColor: Colors.yellowAccent,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,

      title: Text("Taş Kağıt Makas",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      backgroundColor: Colors.yellowAccent,
    );
  }

  Widget _buildBody(String sonuc) {
    return Column(
      children: [
        SizedBox(height: 20,),
        _buildBodyRow(sonuc),
        SizedBox(height: 75,),
        _buildBodyButtons(),
      ],
    );
  }

  Widget _buildBodyRow(String sonuc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(sonuc,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text("Sen"),
                    SizedBox(height: 10,),
                    Image.asset(widget.kullaniciSecimi?.resimYolu ?? ""),
                    Text(widget.kullaniciSecimi?.isim ?? ""),
                  ],
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text("Rakip"),
                    SizedBox(height: 10,),
                    Image.asset(widget.bilgisayarSecimi?.resimYolu ?? ""),
                    Text(widget.bilgisayarSecimi?.isim ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBodyButtons(){
    return Column(
      children: [
        ElevatedButton(
          child: Text("Yeniden Oyna",
          style: TextStyle(
          fontSize: 20
          ),
          ),
          onPressed: (){
            _yenidenOyna(context);

          },
        ),
        SizedBox(height: 30,),
        ElevatedButton(
        child: Text("Yeni Oyun",
        style: TextStyle(
        fontSize: 20
        ),
        ),
        onPressed: (){
          _yeniOyun(context);
          },
        ),
      ],
    ) ;
  }

  void _yenidenOyna(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context){
          return TekKisiGame();
        }
    );
    Navigator.push(context, sayfaYolu);

  }

  void _yeniOyun(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context){
          return AnaSayfa();
        }
    );
    Navigator.push(context, sayfaYolu);

  }
}
