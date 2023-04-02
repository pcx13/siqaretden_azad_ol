import 'package:flutter/material.dart';
import 'package:indi_tergit/api/firebase_api.dart';
import 'package:indi_tergit/data/my_box.dart';
import 'package:indi_tergit/utils/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String say = '';
  String paket = '';
  String qiymet = '';

  List<String> valyuta = ['manat', 'dollar', 'avro'];
  String? value;

  DateTime? dateTime;
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    FirebaseApi.getToken();
    say = MyBox.getSay() ?? '';
    paket = MyBox.getPaket() ?? '';
    qiymet = MyBox.getQiymet() ?? '';
    value = MyBox.getValyuta() ?? valyuta[0];
    dateTime = MyBox.getTarix() ?? DateTime.now();
    isChecked = MyBox.getBildiris() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    int? sSay = int.tryParse(say);
    int? sPaket = int.tryParse(paket);
    double? sQiymet = double.tryParse(qiymet);

    num imtinaSay = say != ''
        ? (DateTime.now().difference(dateTime!).inMinutes) *
            int.tryParse(say)!.toInt() /
            1440
        : 0;

    final deqFerqi = DateTime.now().minute - dateTime!.minute;
    final saatFerqi = DateTime.now().hour - dateTime!.hour;
    final gunFerqi = DateTime.now().day - dateTime!.day;
    final ayFerqi = DateTime.now().month - dateTime!.month;
    final ilFerqi = DateTime.now().year - dateTime!.year;
    final aydaGun =
        DateTime(DateTime.now().year, DateTime.now().month + 0, 0).day;

    String saat() {
      if (sSay != null && deqFerqi >= 0 && saatFerqi >= 0) {
        return '$saatFerqi';
      } else if (sSay != null && deqFerqi >= 0 && saatFerqi < 0) {
        return '${saatFerqi + 24}';
      } else if (sSay != null && deqFerqi < 0 && saatFerqi > 0) {
        return '${saatFerqi - 1}';
      } else if (sSay != null && deqFerqi < 0 && saatFerqi < 1) {
        return '${saatFerqi + 23}';
      } else {
        return '0';
      }
    }

    String gun() {
      if (sSay != null && deqFerqi < 0 && saatFerqi < 1 && gunFerqi > 0) {
        return '${gunFerqi - 1}';
      } else if (sSay != null &&
          deqFerqi < 0 &&
          saatFerqi < 1 &&
          gunFerqi < 1) {
        return '${gunFerqi + aydaGun - 1}';
      } else if (sSay != null && saatFerqi < 0 && gunFerqi > 0) {
        return '${gunFerqi - 1}';
      } else if (sSay != null && saatFerqi < 0 && gunFerqi < 1) {
        return '${gunFerqi + aydaGun - 1}';
      } else if (sSay != null && saatFerqi >= 0 && gunFerqi >= 0) {
        return '$gunFerqi';
      } else if (sSay != null && saatFerqi >= 0 && gunFerqi < 0) {
        return '${gunFerqi + aydaGun}';
      } else {
        return '0';
      }
    }

    String ay() {
      if (sSay != null &&
          deqFerqi < 0 &&
          saatFerqi < 1 &&
          gunFerqi < 1 &&
          ayFerqi > 0) {
        return '${ayFerqi - 1}';
      } else if (sSay != null &&
          deqFerqi < 0 &&
          saatFerqi < 1 &&
          gunFerqi < 1 &&
          ayFerqi < 1) {
        return '${ayFerqi + 11}';
      } else if (sSay != null && saatFerqi < 0 && gunFerqi < 1 && ayFerqi > 0) {
        return '${ayFerqi - 1}';
      } else if (sSay != null && saatFerqi < 0 && gunFerqi < 1 && ayFerqi < 1) {
        return '${ayFerqi + 11}';
      } else if (sSay != null && gunFerqi < 0 && ayFerqi < 1) {
        return '${ayFerqi + 11}';
      } else if (sSay != null && gunFerqi < 0 && ayFerqi > 0) {
        return '${ayFerqi - 1}';
      } else if (sSay != null && gunFerqi >= 0 && ayFerqi >= 0) {
        return '$ayFerqi';
      } else if (sSay != null && gunFerqi >= 0 && ayFerqi < 0) {
        return '${ayFerqi + 12}';
      } else {
        return '0';
      }
    }

    String il() {
      if (sSay != null &&
          deqFerqi < 0 &&
          saatFerqi < 1 &&
          gunFerqi < 1 &&
          ayFerqi < 1) {
        return '${ilFerqi - 1}';
      } else if (sSay != null && saatFerqi < 0 && gunFerqi < 1 && ayFerqi < 1) {
        return '${ilFerqi - 1}';
      } else if (sSay != null && gunFerqi < 0 && ayFerqi < 1) {
        return '${ilFerqi - 1}';
      } else if (sSay != null && ayFerqi < 0) {
        return '${ilFerqi - 1}';
      } else if (sSay != null && ayFerqi >= 0) {
        return '$ilFerqi';
      } else {
        return '0';
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: const Text('Hesablama'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(mq.width * 0.042),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: mq.width * 0.055,
                vertical: mq.width * 0.07,
              ),
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
              child: Column(
                children: [
                  Text(
                    'Siqaret çəkmirəm',
                    style: TextStyle(
                      color: Styles.textColor,
                      fontSize: mq.width * 0.055,
                    ),
                  ),
                  SizedBox(height: mq.width * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            il(),
                            style: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                          SizedBox(height: mq.width * 0.042),
                          Text(
                            'İl',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            ay(),
                            style: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                          SizedBox(height: mq.width * 0.042),
                          Text(
                            'Ay',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            gun(),
                            style: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                          SizedBox(height: mq.width * 0.042),
                          Text(
                            'Gün',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            saat(),
                            style: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                          SizedBox(height: mq.width * 0.042),
                          Text(
                            'Saat',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: mq.width * 0.042),
            Container(
              padding: EdgeInsets.symmetric(vertical: mq.width * 0.01),
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
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.042),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Styles.boxColor,
                      child: Icon(
                        Styles.quitIcon,
                        color: Styles.iconColor,
                        size: mq.width * 0.083,
                      ),
                    ),
                    SizedBox(width: mq.width * 0.042),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'İmtina edilən siqaret',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                          SizedBox(height: mq.width * 0.0139),
                          say != ''
                              ? Text(
                                  '${imtinaSay.truncate()}',
                                  style: TextStyle(color: Styles.numColor),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(color: Styles.numColor),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: mq.width * 0.042),
            Container(
              padding: EdgeInsets.symmetric(vertical: mq.width * 0.01),
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
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.042),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Styles.boxColor,
                      child: value == valyuta[0]
                          ? Text(
                              '₼',
                              style: TextStyle(
                                color: Styles.iconColor,
                                fontSize: mq.width * 0.094,
                              ),
                            )
                          : value == valyuta[1]
                              ? Text(
                                  '\$',
                                  style: TextStyle(
                                    color: Styles.iconColor,
                                    fontSize: mq.width * 0.094,
                                  ),
                                )
                              : Text(
                                  '€',
                                  style: TextStyle(
                                    color: Styles.iconColor,
                                    fontSize: mq.width * 0.094,
                                  ),
                                ),
                    ),
                    SizedBox(width: mq.width * 0.042),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pula qənaət',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                          SizedBox(height: mq.width * 0.0139),
                          qiymet != '' &&
                                  qiymet != '0' &&
                                  say != '' &&
                                  say != '0' &&
                                  paket != '' &&
                                  paket != '0'
                              ? Text(
                                  ((sQiymet! / sPaket!) * imtinaSay.truncate())
                                      .toStringAsFixed(2),
                                  style: TextStyle(color: Styles.numColor),
                                )
                              : Text(
                                  '0.0',
                                  style: TextStyle(color: Styles.numColor),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: mq.width * 0.042),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: mq.width * 0.055,
                vertical: mq.width * 0.07,
              ),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: 'Hər siqaret insan ömründən 11 dəqiqə alır',
                        triggerMode: TooltipTriggerMode.tap,
                        showDuration: const Duration(seconds: 2),
                        child: Icon(
                          Styles.infoIcon,
                          color: Styles.iconColor,
                          size: mq.width * 0.07,
                        ),
                      ),
                      SizedBox(width: mq.width * 0.028),
                      Text(
                        'Qazanılan zaman',
                        style: TextStyle(
                          color: Styles.textColor,
                          fontSize: mq.width * 0.055,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mq.width * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          say != ''
                              ? Text(
                                  '${(((imtinaSay.truncate() * 11) / 1440).truncate() / 365).truncate()}',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                ),
                          SizedBox(height: mq.width * 0.028),
                          Text(
                            'İl',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          say != ''
                              ? Text(
                                  '${((((imtinaSay.truncate() * 11) / 1440).truncate()).remainder(365) / 30).truncate()}',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                ),
                          SizedBox(height: mq.width * 0.028),
                          Text(
                            'Ay',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          say != ''
                              ? Text(
                                  '${(((imtinaSay.truncate() * 11) / 1440).truncate()).remainder(365).remainder(30).truncate()}',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                ),
                          SizedBox(height: mq.width * 0.028),
                          Text(
                            'Gün',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(mq.width * 0.042),
                    child: Divider(
                      height: mq.width * 0.004,
                      color: Styles.primaryColor,
                      thickness: mq.width * 0.0014,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          say != ''
                              ? Text(
                                  '${(((imtinaSay.truncate() * 11).remainder(1440)) / 60).truncate()}',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                ),
                          SizedBox(height: mq.width * 0.028),
                          Text(
                            'Saat',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          say != ''
                              ? Text(
                                  '${((imtinaSay.truncate() * 11).remainder(1440)).remainder(60).truncate()}',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                )
                              : Text(
                                  '0',
                                  style: TextStyle(
                                    color: Styles.numColor,
                                    fontSize: mq.width * 0.05,
                                  ),
                                ),
                          SizedBox(height: mq.width * 0.028),
                          Text(
                            'Dəqiqə',
                            style: TextStyle(
                              color: Styles.textColor,
                              fontSize: mq.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
