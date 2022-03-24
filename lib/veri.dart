import 'soru.dart';

class Veri {
  int _soruNo = 0;

  final List<Soru> _soruBankasi = [
    Soru(
        soruMetni: '1.Titanic gelmiş geçmiş en büyük gemidir',
        soruYaniti: false),
    Soru(
        soruMetni: '2.Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: '3.Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: '4.Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: '7.Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
    Soru(
        soruMetni: '8.Güneş takvim yılı  ay takvim yılından 10 gün uzundur',
        soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruNo].soruMetni!;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruNo].soruYaniti!;
  }

  void sonrakiSoru() {
    if (_soruNo < _soruBankasi.length) {
      _soruNo++;
    }
  }

  bool gameOver() {
    if (_soruNo < _soruBankasi.length) {
      return false;
    } else {
      return true;
    }
  }

  void testiSifirla() {
    if (gameOver()) {
      _soruNo = 0;
    }
  }
}
