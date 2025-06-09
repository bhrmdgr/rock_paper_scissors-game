import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/ana_sayfa.dart';
import 'package:rock_paper_scissors/birinci_oyuncu_secim_ekrani.dart';
import 'package:rock_paper_scissors/secenekler.dart';
import 'package:rock_paper_scissors/tek_kisi_game.dart';

class IkiKisiOyunEkrani extends StatefulWidget {
  final Secenekler? birinciOyuncuSecimi;
  final Secenekler? ikinciOyuncuSecimi;
  final String birinciOyuncuIsim;
  final String ikinciOyuncuIsim;

  const IkiKisiOyunEkrani({
    Key? key,
    required this.birinciOyuncuIsim,
    required this.ikinciOyuncuIsim,
    this.birinciOyuncuSecimi,
    this.ikinciOyuncuSecimi,
  }) : super(key: key);

  @override
  State<IkiKisiOyunEkrani> createState() => _IkiKisiOyunEkraniState();
}

class _IkiKisiOyunEkraniState extends State<IkiKisiOyunEkrani> {
  @override
  Widget build(BuildContext context) {
    // Sonucu hesapla
    String sonuc;
    if (widget.birinciOyuncuSecimi?.isim == widget.ikinciOyuncuSecimi?.isim) {
      sonuc = "Berabere";
    } else if (widget.birinciOyuncuSecimi?.isim == "Taş" &&
        widget.ikinciOyuncuSecimi?.isim == "Kağıt") {
      sonuc = "${widget.ikinciOyuncuIsim} Kazandı";
    } else if (widget.birinciOyuncuSecimi?.isim == "Taş" &&
        widget.ikinciOyuncuSecimi?.isim == "Makas") {
      sonuc = "${widget.birinciOyuncuIsim} Kazandı";
    } else if (widget.birinciOyuncuSecimi?.isim == "Kağıt" &&
        widget.ikinciOyuncuSecimi?.isim == "Taş") {
      sonuc = "${widget.birinciOyuncuIsim} Kazandı";
    } else if (widget.birinciOyuncuSecimi?.isim == "Kağıt" &&
        widget.ikinciOyuncuSecimi?.isim == "Makas") {
      sonuc = "${widget.ikinciOyuncuIsim} Kazandı";
    } else if (widget.birinciOyuncuSecimi?.isim == "Makas" &&
        widget.ikinciOyuncuSecimi?.isim == "Taş") {
      sonuc = "${widget.ikinciOyuncuIsim}S Kazandı";
    } else if (widget.birinciOyuncuSecimi?.isim == "Makas" &&
        widget.ikinciOyuncuSecimi?.isim == "Kağıt") {
      sonuc = "${widget.birinciOyuncuIsim} Kazandı";
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
      title: Text(
        "Taş Kağıt Makas",
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
        SizedBox(height: 20),
        _buildBodyRow(sonuc),
        SizedBox(height: 75),
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
              child: Text(
                sonuc,
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
                    Text(widget.birinciOyuncuIsim),
                    SizedBox(height: 10),
                    Image.asset(
                      widget.birinciOyuncuSecimi?.resimYolu ?? "assets/images/placeholder.png",
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Text('Görsel yüklenemedi');
                      },
                    ),
                    Text(widget.birinciOyuncuSecimi?.isim ?? ""),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(widget.ikinciOyuncuIsim),
                    SizedBox(height: 10),
                    Image.asset(
                      widget.ikinciOyuncuSecimi?.resimYolu ?? "assets/images/placeholder.png",
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Text('Görsel yüklenemedi');
                      },
                    ),
                    Text(widget.ikinciOyuncuSecimi?.isim ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBodyButtons() {
    return Column(
      children: [
        ElevatedButton(
          child: Text(
            "Yeniden Oyna",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            _yenidenOyna(context);
          },
        ),
        SizedBox(height: 30),
        ElevatedButton(
          child: Text(
            "Yeni Oyun",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            _yeniOyun(context);
          },
        ),
      ],
    );
  }

  void _yenidenOyna(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return BirinciOyuncuSecimEkrani(birinciOyuncuIsim: widget.birinciOyuncuIsim, ikinciOyuncuIsim: widget.ikinciOyuncuIsim,);
      },
    );
    Navigator.push(context, sayfaYolu);
  }

  void _yeniOyun(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return AnaSayfa();
      },
    );
    Navigator.push(context, sayfaYolu);
  }
}
