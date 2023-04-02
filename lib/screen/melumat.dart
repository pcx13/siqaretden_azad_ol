import 'package:flutter/material.dart';
import 'package:indi_tergit/screen/heqiqetler.dart';
import 'package:indi_tergit/screen/indi_tergit.dart';
import 'package:indi_tergit/screen/riskler.dart';
import 'package:indi_tergit/screen/statistika.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:indi_tergit/widgets/destek.dart';

class Melumat extends StatelessWidget {
  const Melumat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: const Text('İnformativ Dəstək'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(mq.width * 0.042),
        child: Column(
          children: [
            Destek(
                widget: const Heqiqetler(),
                icon: Styles.docIcon,
                string: 'Ümumi Məlumat'),
            SizedBox(height: mq.width * 0.028),
            Destek(
                widget: const Riskler(),
                icon: Styles.pulseIcon,
                string: 'Risklər'),
            SizedBox(height: mq.width * 0.028),
            Destek(
                widget: const Statistika(),
                icon: Styles.dataIcon,
                string: 'Statistika'),
            SizedBox(height: mq.width * 0.028),
            Destek(
                widget: const IndiTergit(),
                icon: Styles.errorIcon,
                string: 'İndi Tərgit'),
          ],
        ),
      ),
    );
  }
}
