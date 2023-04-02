import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoBox extends StatelessWidget {
  final String info;
  final String zaman;
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
    final mq = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(mq.width * 0.028),
      decoration: BoxDecoration(
          color: Styles.boxColor,
          borderRadius: BorderRadius.all(
            Radius.circular(mq.width * 0.042),
          ),
          boxShadow: [
            BoxShadow(
              color: Styles.shadowColor,
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            )
          ]),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: mq.width * 0.07,
            lineWidth: mq.width * 0.016,
            percent: yuzde,
            center: faiz,
            progressColor: Styles.progressColor,
          ),
          SizedBox(width: mq.width * 0.028),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info,
                  style: TextStyle(
                    color: Styles.textColor,
                    fontSize: mq.width * 0.045,
                  ),
                ),
                SizedBox(height: mq.width * 0.0139),
                Text(
                  zaman,
                  style: TextStyle(
                    color: Styles.numColor,
                    fontSize: mq.width * 0.039,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
