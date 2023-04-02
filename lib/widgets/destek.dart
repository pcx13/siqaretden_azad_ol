import 'package:flutter/material.dart';
import 'package:indi_tergit/utils/styles.dart';

class Destek extends StatelessWidget {
  final Widget widget;
  final IconData icon;
  final String string;

  const Destek({
    Key? key,
    required this.widget,
    required this.string,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mq.width * 0.042),
          color: Styles.boxColor,
          boxShadow: [
            BoxShadow(
              color: Styles.shadowColor,
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            )
          ]),
      child: MaterialButton(
        padding: EdgeInsets.all(mq.width * 0.055),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(mq.width * 0.042),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ),
          );
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: Styles.icon2Color,
              size: mq.width * 0.089,
            ),
            SizedBox(width: mq.width * 0.042),
            Flexible(
              child: Text(
                string,
                style: TextStyle(
                  color: Styles.textColor,
                  fontSize: mq.width * 0.055,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
