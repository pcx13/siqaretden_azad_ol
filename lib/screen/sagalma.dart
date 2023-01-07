import 'package:flutter/material.dart';
import 'package:indi_tergit/data/my_box.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:indi_tergit/utils/texts.dart';
import 'package:indi_tergit/widgets/info_box.dart';

class Sagalma extends StatefulWidget {
  const Sagalma({Key? key}) : super(key: key);

  @override
  State<Sagalma> createState() => _SagalmaState();
}

class _SagalmaState extends State<Sagalma> {
  String say = '';
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    say = MyBox.getSay() ?? '';
    dateTime = MyBox.getTarix() ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    int? sSay = int.tryParse(say);
    var deqFerqi = DateTime.now().difference(dateTime!).inMinutes;
    var gunFerqi = DateTime.now().difference(dateTime!).inDays;
    var aydaGun =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: const Text('Sağlamlıq'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          InfoBox(
            info: Texts.info20deq,
            zaman: Texts.zaman20deq,
            faiz: sSay != null && deqFerqi >= 20
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(deqFerqi * 100 / 20).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && deqFerqi >= 20
                ? 1.0
                : sSay != null
                    ? deqFerqi / 20
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info12saat,
            zaman: Texts.zaman12saat,
            faiz: sSay != null && deqFerqi >= 720
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(deqFerqi * 100 / 720).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && deqFerqi >= 720
                ? 1.0
                : sSay != null
                    ? deqFerqi / 720
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info2gun,
            zaman: Texts.zaman2gun,
            faiz: sSay != null && deqFerqi >= 2880
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(deqFerqi * 100 / 2880).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && deqFerqi >= 2880
                ? 1.0
                : sSay != null
                    ? deqFerqi / 2880
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info2hefte,
            zaman: Texts.zaman2hefte,
            faiz: sSay != null && deqFerqi >= 10080
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(deqFerqi * 100 / 10080).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && deqFerqi >= 10080
                ? 1.0
                : sSay != null
                    ? deqFerqi / 10080
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info1ay,
            zaman: Texts.zaman1ay,
            faiz: sSay != null && gunFerqi >= aydaGun
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / aydaGun).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= aydaGun
                ? 1.0
                : sSay != null
                    ? gunFerqi / aydaGun
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info3ay,
            zaman: Texts.zaman3ay,
            faiz: sSay != null && gunFerqi >= 91
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 91).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 91
                ? 1.0
                : sSay != null
                    ? gunFerqi / 91
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info6ay,
            zaman: Texts.zaman6ay,
            faiz: sSay != null && gunFerqi >= 182
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 182).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 182
                ? 1.0
                : sSay != null
                    ? gunFerqi / 182
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info9ay,
            zaman: Texts.zaman9ay,
            faiz: sSay != null && gunFerqi >= 274
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 274).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 274
                ? 1.0
                : sSay != null
                    ? gunFerqi / 274
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info1il,
            zaman: Texts.zaman1il,
            faiz: sSay != null && gunFerqi >= 365
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 365).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 365
                ? 1.0
                : sSay != null
                    ? gunFerqi / 365
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info3il,
            zaman: Texts.zaman3il,
            faiz: sSay != null && gunFerqi >= 1095
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 1095).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 1095
                ? 1.0
                : sSay != null
                    ? gunFerqi / 1095
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info5il,
            zaman: Texts.zaman5il,
            faiz: sSay != null && gunFerqi >= 1826
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 1826).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 1826
                ? 1.0
                : sSay != null
                    ? gunFerqi / 1826
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info10il,
            zaman: Texts.zaman10il,
            faiz: sSay != null && gunFerqi >= 3652
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 3652).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 3652
                ? 1.0
                : sSay != null
                    ? gunFerqi / 3652
                    : 0.0,
          ),
          const SizedBox(height: 10),
          InfoBox(
            info: Texts.info15il,
            zaman: Texts.zaman15il,
            faiz: sSay != null && gunFerqi >= 5478
                ? Text(
                    '✓',
                    style: TextStyle(fontSize: 30, color: Styles.progressColor),
                  )
                : sSay != null
                    ? Text(
                        '${(gunFerqi * 100 / 5478).truncate()}%',
                        style: TextStyle(color: Styles.numColor),
                      )
                    : Text(
                        '0%',
                        style: TextStyle(color: Styles.numColor),
                      ),
            yuzde: sSay != null && gunFerqi >= 5478
                ? 1.0
                : sSay != null
                    ? gunFerqi / 5478
                    : 0.0,
          ),
        ],
      ),
    );
  }
}
