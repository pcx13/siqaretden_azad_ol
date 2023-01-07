import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:indi_tergit/utils/texts.dart';
import 'package:indi_tergit/widgets/info_text.dart';

class IndiTergit extends StatelessWidget {
  const IndiTergit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: Texts.basliq4,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          InfoText(movzu: Texts.movzu4),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu41),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu42),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu43),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu44),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu45),
          const SizedBox(height: 15),
          InfoText(movzu: Texts.movzu46),
        ],
      ),
    );
  }
}