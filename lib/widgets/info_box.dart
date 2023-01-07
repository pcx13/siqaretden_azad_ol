import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoBox extends StatelessWidget {
  final Text info;
  final Text zaman;
  final Text faiz;
  final double yuzde;

  const InfoBox(
      {Key? key,
      required this.info,
      required this.zaman,
      required this.faiz,
      required this.yuzde})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Styles.boxColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Styles.shadowColor,
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            )
          ]),
      child: ListTile(
        leading: SizedBox(
          child: CircularPercentIndicator(
            radius: 25.0,
            lineWidth: 6.0,
            percent: yuzde,
            center: faiz,
            progressColor: Styles.progressColor,
          ),
        ),
        title: info,
        subtitle: zaman,
      ),
    );
  }
}
