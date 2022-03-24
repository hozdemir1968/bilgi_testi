import 'package:flutter/material.dart';
import 'constants.dart';
import 'veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Bilgi Testi Soruları'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  Veri test_1 = Veri();

  /*List<String> sorular = [
    '1.Titanic gelmiş geçmiş en büyük gemidir, false',
    '2.Dünyadaki tavuk sayısı insan sayısından fazladır, true',
    '3.Kelebeklerin ömrü bir gündür, false',
    '4.Dünya düzdür, false',
    '5.Kaju fıstığı aslında bir meyvenin sapıdır, true',
    '6.Fatih Sultan Mehmet hiç patates yememiştir, true',
    '7.Fransızlar 80 demek için, 4 - 20 der, true',
  ];
  List<bool> yanitlar = [
    false,
    true,
    false,
    false,
    true,
    true,
    true,
  ];*/

  void cevapKontrol(bool secim) {
    if (test_1.gameOver()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Oyun bitt!'),
              content: Text('Yeniden başlasın mı?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Kapat')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        test_1.testiSifirla();
                        secimler.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Yeniden başla')),
              ],
            );
          });
    } else {
      setState(() {
        test_1.getSoruYaniti() == secim
            ? secimler.add(kDogruIconu)
            : secimler.add(kYanlisIconu);
        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: !test_1.gameOver()
                    ? Text(
                        test_1.getSoruMetni(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'GAME OVER!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )),
          ),
        ),
        Wrap(spacing: 10, runSpacing: 10, children: secimler),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            cevapKontrol(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: const Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            cevapKontrol(true);
                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}
