import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    say = MyBox.getSay() ?? '';
    paket = MyBox.getPaket() ?? '';
    qiymet = MyBox.getQiymet() ?? '';
    value = MyBox.getValyuta() ?? valyuta[0];
    dateTime = MyBox.getTarix() ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    int? sSay = int.tryParse(say);
    int? sPaket = int.tryParse(paket);
    double? sQiymet = double.tryParse(qiymet);

    num imtinaSay = say != ''
        ? (DateTime.now().difference(dateTime!).inMinutes) *
            int.tryParse(say)!.toInt() /
            1440
        : 0;

    var deqFerqi = DateTime.now().minute - dateTime!.minute;
    var saatFerqi = DateTime.now().hour - dateTime!.hour;
    var gunFerqi = DateTime.now().day - dateTime!.day;
    var ayFerqi = DateTime.now().month - dateTime!.month;
    var ilFerqi = DateTime.now().year - dateTime!.year;
    var aydaGun =
        DateTime(DateTime.now().year, DateTime.now().month + 0, 0).day;

    Text saat = sSay != null && deqFerqi >= 0 && saatFerqi >= 0
        ? Text(
            '$saatFerqi',
            style: Styles.numStyle,
          )
        : sSay != null && deqFerqi >= 0 && saatFerqi < 0
            ? Text(
                '${saatFerqi + 24}',
                style: Styles.numStyle,
              )
            : sSay != null && deqFerqi < 0 && saatFerqi > 0
                ? Text(
                    '${saatFerqi - 1}',
                    style: Styles.numStyle,
                  )
                : sSay != null && deqFerqi < 0 && saatFerqi < 1
                    ? Text(
                        '${saatFerqi + 23}',
                        style: Styles.numStyle,
                      )
                    : Text(
                        '0',
                        style: Styles.numStyle,
                      );

    Text gun = sSay != null && deqFerqi < 0 && saatFerqi < 1 && gunFerqi > 0
        ? Text(
            '${gunFerqi - 1}',
            style: Styles.numStyle,
          )
        : sSay != null && deqFerqi < 0 && saatFerqi < 1 && gunFerqi < 1
            ? Text(
                '${gunFerqi + aydaGun - 1}',
                style: Styles.numStyle,
              )
            : sSay != null && saatFerqi < 0 && gunFerqi > 0
                ? Text(
                    '${gunFerqi - 1}',
                    style: Styles.numStyle,
                  )
                : sSay != null && saatFerqi < 0 && gunFerqi < 1
                    ? Text(
                        '${gunFerqi + aydaGun - 1}',
                        style: Styles.numStyle,
                      )
                    : sSay != null && saatFerqi >= 0 && gunFerqi >= 0
                        ? Text(
                            '$gunFerqi',
                            style: Styles.numStyle,
                          )
                        : sSay != null && saatFerqi >= 0 && gunFerqi < 0
                            ? Text(
                                '${gunFerqi + aydaGun}',
                                style: Styles.numStyle,
                              )
                            : Text(
                                '0',
                                style: Styles.numStyle,
                              );

    Text ay = sSay != null &&
            deqFerqi < 0 &&
            saatFerqi < 1 &&
            gunFerqi < 1 &&
            ayFerqi > 0
        ? Text(
            '${ayFerqi - 1}',
            style: Styles.numStyle,
          )
        : sSay != null &&
                deqFerqi < 0 &&
                saatFerqi < 1 &&
                gunFerqi < 1 &&
                ayFerqi < 1
            ? Text(
                '${ayFerqi + 11}',
                style: Styles.numStyle,
              )
            : sSay != null && saatFerqi < 0 && gunFerqi < 1 && ayFerqi > 0
                ? Text(
                    '${ayFerqi - 1}',
                    style: Styles.numStyle,
                  )
                : sSay != null && saatFerqi < 0 && gunFerqi < 1 && ayFerqi < 1
                    ? Text(
                        '${ayFerqi + 11}',
                        style: Styles.numStyle,
                      )
                    : sSay != null && gunFerqi < 0 && ayFerqi < 1
                        ? Text(
                            '${ayFerqi + 11}',
                            style: Styles.numStyle,
                          )
                        : sSay != null && gunFerqi < 0 && ayFerqi > 0
                            ? Text(
                                '${ayFerqi - 1}',
                                style: Styles.numStyle,
                              )
                            : sSay != null && gunFerqi >= 0 && ayFerqi >= 0
                                ? Text(
                                    '$ayFerqi',
                                    style: Styles.numStyle,
                                  )
                                : sSay != null && gunFerqi >= 0 && ayFerqi < 0
                                    ? Text(
                                        '${ayFerqi + 12}',
                                        style: Styles.numStyle,
                                      )
                                    : Text(
                                        '0',
                                        style: Styles.numStyle,
                                      );

    Text il = sSay != null &&
            deqFerqi < 0 &&
            saatFerqi < 1 &&
            gunFerqi < 1 &&
            ayFerqi < 1
        ? Text(
            '${ilFerqi - 1}',
            style: Styles.numStyle,
          )
        : sSay != null && saatFerqi < 0 && gunFerqi < 1 && ayFerqi < 1
            ? Text(
                '${ilFerqi - 1}',
                style: Styles.numStyle,
              )
            : sSay != null && gunFerqi < 0 && ayFerqi < 1
                ? Text(
                    '${ilFerqi - 1}',
                    style: Styles.numStyle,
                  )
                : sSay != null && ayFerqi < 0
                    ? Text(
                        '${ilFerqi - 1}',
                        style: Styles.numStyle,
                      )
                    : sSay != null && ayFerqi >= 0
                        ? Text(
                            '$ilFerqi',
                            style: Styles.numStyle,
                          )
                        : Text(
                            '0',
                            style: Styles.numStyle,
                          );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: const Text('Hesablama'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
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
            child: Column(
              children: [
                Text(
                  'Siqaret çəkmirəm',
                  style: Styles.headLine,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        il,
                        const SizedBox(height: 15),
                        Text(
                          'İl',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ay,
                        const SizedBox(height: 15),
                        Text(
                          'Ay',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        gun,
                        const SizedBox(height: 15),
                        Text(
                          'Gün',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        saat,
                        const SizedBox(height: 15),
                        Text(
                          'Saat',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
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
              leading: CircleAvatar(
                backgroundColor: Styles.boxColor,
                child: Icon(
                  Styles.quitIcon,
                  color: Styles.iconColor,
                  size: 30,
                ),
              ),
              title: Text(
                'İmtina edilən siqaret',
                style: Styles.textStyle,
              ),
              subtitle: say != ''
                  ? Text(
                      '${imtinaSay.truncate()}',
                      style: TextStyle(color: Styles.numColor),
                    )
                  : Text(
                      '0',
                      style: TextStyle(color: Styles.numColor),
                    ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
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
              leading: CircleAvatar(
                backgroundColor: Styles.boxColor,
                child: value == valyuta[0]
                    ? Text(
                        '₼',
                        style: TextStyle(
                          color: Styles.iconColor,
                          fontSize: 34,
                        ),
                      )
                    : value == valyuta[1]
                        ? Text(
                            '\$',
                            style: TextStyle(
                              color: Styles.iconColor,
                              fontSize: 34,
                            ),
                          )
                        : Text(
                            '€',
                            style: TextStyle(
                              color: Styles.iconColor,
                              fontSize: 34,
                            ),
                          ),
              ),
              title: Text(
                'Pula qənaət',
                style: Styles.textStyle,
              ),
              subtitle: qiymet != '' &&
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
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
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
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Qazanılan zaman',
                      style: Styles.headLine,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        say != ''
                            ? Text(
                                '${(((imtinaSay.truncate() * 11) / 1440).truncate() / 365).truncate()}',
                                style: Styles.numStyle,
                              )
                            : Text(
                                '0',
                                style: Styles.numStyle,
                              ),
                        const SizedBox(height: 10),
                        Text(
                          'İl',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        say != ''
                            ? Text(
                                '${((((imtinaSay.truncate() * 11) / 1440).truncate()).remainder(365) / 30).truncate()}',
                                style: Styles.numStyle,
                              )
                            : Text(
                                '0',
                                style: Styles.numStyle,
                              ),
                        const SizedBox(height: 10),
                        Text(
                          'Ay',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        say != ''
                            ? Text(
                                '${(((imtinaSay.truncate() * 11) / 1440).truncate()).remainder(365).remainder(30).truncate()}',
                                style: Styles.numStyle,
                              )
                            : Text(
                                '0',
                                style: Styles.numStyle,
                              ),
                        const SizedBox(height: 10),
                        Text(
                          'Gün',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Divider(
                    height: 1.5,
                    color: Styles.primaryColor,
                    thickness: 0.5,
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
                                style: Styles.numStyle,
                              )
                            : Text(
                                '0',
                                style: Styles.numStyle,
                              ),
                        const SizedBox(height: 10),
                        Text(
                          'Saat',
                          style: Styles.textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        say != ''
                            ? Text(
                                '${((imtinaSay.truncate() * 11).remainder(1440)).remainder(60).truncate()}',
                                style: Styles.numStyle,
                              )
                            : Text(
                                '0',
                                style: Styles.numStyle,
                              ),
                        const SizedBox(height: 10),
                        Text(
                          'Dəqiqə',
                          style: Styles.textStyle,
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
    );
  }
}
