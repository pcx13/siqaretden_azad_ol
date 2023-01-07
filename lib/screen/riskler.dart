import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:indi_tergit/utils/texts.dart';
import 'package:indi_tergit/widgets/info_text.dart';

class Riskler extends StatelessWidget {
  const Riskler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: Texts.basliq2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          InfoText(movzu: Texts.movzu2),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu21),
        ],
      ),
    );
  }
}
