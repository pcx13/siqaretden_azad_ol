import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:indi_tergit/utils/texts.dart';
import 'package:indi_tergit/widgets/info_text.dart';

class IndiTergit extends StatelessWidget {
  const IndiTergit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: Texts.basliq4,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(mq.width * 0.042),
        child: Column(
          children: [
            InfoText(movzu: Texts.movzu4),
            SizedBox(height: mq.width * 0.042),
            InfoText(movzu: Texts.movzu41),
            SizedBox(height: mq.width * 0.042),
            InfoText(movzu: Texts.movzu42),
            SizedBox(height: mq.width * 0.042),
            InfoText(movzu: Texts.movzu43),
            SizedBox(height: mq.width * 0.042),
            InfoText(movzu: Texts.movzu44),
            SizedBox(height: mq.width * 0.042),
            InfoText(movzu: Texts.movzu45),
            SizedBox(height: mq.width * 0.042),
            InfoText(movzu: Texts.movzu46),
          ],
        ),
      ),
    );
  }
}
