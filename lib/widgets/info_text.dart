import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';

class InfoText extends StatelessWidget {
  final Text movzu;

  const InfoText({Key? key, required this.movzu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(mq.width * 0.042),
      decoration: BoxDecoration(
          color: Styles.shadowColor,
          borderRadius: BorderRadius.circular(mq.width * 0.042),
          boxShadow: [
            BoxShadow(
              color: Styles.shadowColor,
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            )
          ]),
      child: movzu,
    );
  }
}
