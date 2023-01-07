import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:indi_tergit/utils/texts.dart';
import 'package:indi_tergit/widgets/info_text.dart';

class Heqiqetler extends StatelessWidget {
  const Heqiqetler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: Texts.basliq1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          InfoText(movzu: Texts.movzu1),
        ],
      ),
    );
  }
}
