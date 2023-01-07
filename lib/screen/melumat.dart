import 'package:flutter/material.dart';
import 'package:indi_tergit/screen/heqiqetler.dart';
import 'package:indi_tergit/screen/indi_tergit.dart';
import 'package:indi_tergit/screen/riskler.dart';
import 'package:indi_tergit/screen/statistika.dart';
import 'package:indi_tergit/utils/styles.dart';

class Melumat extends StatelessWidget {
  const Melumat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: const Text('İnformativ Dəstək'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.boxColor,
                boxShadow: [
                  BoxShadow(
                    color: Styles.shadowColor,
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  )
                ]),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Heqiqetler(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Styles.docIcon,
                    color: Styles.icon2Color,
                    size: 32,
                  ),
                  Text(
                    '   Ümumi Məlumat',
                    style: Styles.headLine,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.boxColor,
                boxShadow: [
                  BoxShadow(
                    color: Styles.shadowColor,
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  )
                ]),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Riskler(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Styles.pulseIcon,
                    color: Styles.icon2Color,
                    size: 32,
                  ),
                  Text(
                    '   Risklər',
                    style: Styles.headLine,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.boxColor,
                boxShadow: [
                  BoxShadow(
                    color: Styles.shadowColor,
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  )
                ]),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Statistika(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Styles.dataIcon,
                    color: Styles.icon2Color,
                    size: 32,
                  ),
                  Text(
                    '   Statistika',
                    style: Styles.headLine,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.boxColor,
                boxShadow: [
                  BoxShadow(
                    color: Styles.shadowColor,
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  )
                ]),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndiTergit(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Styles.errorIcon,
                    color: Styles.icon2Color,
                    size: 32,
                  ),
                  Text(
                    '   İndi Tərgit',
                    style: Styles.headLine,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
