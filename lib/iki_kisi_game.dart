import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/birinci_oyuncu_secim_ekrani.dart';

class IkiKisiGame extends StatelessWidget {
  TextEditingController _birinciIsimController = TextEditingController();
  TextEditingController _ikinciIsimController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context), // Burada context'i geçiyoruz
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.yellowAccent,
      title: Text(
        "Taş Kağıt Makas",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/tkm.png"),
        SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(hintText: "1. Oyuncu İsmini Girin"),
              controller: _birinciIsimController,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(hintText: "2. Oyuncu İsmini Girin"),
              controller: _ikinciIsimController,
            ),
          ),
        ),
        ElevatedButton(
          child: Text("Devam Et"),
          onPressed: () {
            _devamButtonTiklandi(context); // Burada context'i geçiyoruz
          },
        ),
        SizedBox(height: 100)
      ],
    );
  }

  void _devamButtonTiklandi(BuildContext context) {
    String birinciOyuncuIsim = _birinciIsimController.text;
    String ikinciOyuncuIsim = _ikinciIsimController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BirinciOyuncuSecimEkrani(
          birinciOyuncuIsim: birinciOyuncuIsim,
          ikinciOyuncuIsim: ikinciOyuncuIsim,
        ),
      ),
    );
  }
}
