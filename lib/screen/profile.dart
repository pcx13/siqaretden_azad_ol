import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indi_tergit/data/my_box.dart';
import 'package:indi_tergit/screen/bottom_bar.dart';
import 'package:indi_tergit/utils/styles.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String say = '';
  String paket = '';
  String qiymet = '';

  List<String> valyuta = ['manat', 'dollar', 'avro'];
  String? value;

  DateTime? dateTime;
  bool? isChecked;
  final dateFormat1 = DateFormat('dd.MM.yyyy');
  final dateFormat2 = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.primaryColor,
      appBar: AppBar(
        backgroundColor: Styles.boxColor,
        title: const Text('Şəxsi parametrlər'),
        actions: [
          IconButton(
            onPressed: _showClearAlert,
            icon: Icon(Styles.resetIcon),
            tooltip: 'Sıfırla',
          ),
          /*PopupMenuButton(
            icon: Icon(
              Styles.dotsIcon,
              color: Styles.valColor,
            ),
            color: Styles.boxColor,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          isChecked == false
                              ? setState(() {
                                  MyBox.setBildiris(true);
                                  isChecked = true;
                                })
                              : isChecked == true
                                  ? setState(() {
                                      MyBox.setBildiris(false);
                                      isChecked = false;
                                    })
                                  : null;
                        },
                        child: Text(
                          'Bildirişlər',
                          style: TextStyle(
                            color: Styles.valColor,
                            fontSize: mq.width * 0.045,
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          primarySwatch: Styles.themeColor,
                          unselectedWidgetColor: Styles.valColor,
                        ),
                        child: Checkbox(
                            value: isChecked,
                            onChanged: (onChanged) {
                              isChecked == false
                                  ? setState(() {
                                      MyBox.setBildiris(true);
                                      isChecked = onChanged!;
                                    })
                                  : isChecked == true
                                      ? setState(() {
                                          MyBox.setBildiris(false);
                                          isChecked = onChanged!;
                                        })
                                      : null;
                            }),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),*/
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(mq.width * 0.042),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: mq.width * 0.042,
                vertical: mq.width * 0.028,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Siqareti buraxdığınız tarix:',
                          style: TextStyle(
                            color: Styles.textColor,
                            fontSize: mq.width * 0.05,
                          ),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: pickDateTime,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      dateFormat1.format(dateTime!),
                                      style: TextStyle(
                                        color: Styles.numColor,
                                        fontSize: mq.width * 0.045,
                                      ),
                                    ),
                                    SizedBox(height: mq.width * 0.009),
                                    Text(
                                      dateFormat2.format(dateTime!),
                                      style: TextStyle(
                                        color: Styles.numColor,
                                        fontSize: mq.width * 0.045,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: mq.width * 0.0139),
                    child: Divider(
                        height: mq.width * 0.004,
                        color: Styles.primaryColor,
                        thickness: mq.width * 0.0014),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Bir gündə çəkilən siqaret:',
                          style: TextStyle(
                            color: Styles.textColor,
                            fontSize: mq.width * 0.05,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: say,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.right,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '0',
                            hintStyle: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.045,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Styles.numColor,
                            fontSize: mq.width * 0.045,
                          ),
                          onChanged: (say) => setState(() => this.say = say),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: mq.width * 0.0139),
                    child: Divider(
                        height: mq.width * 0.004,
                        color: Styles.primaryColor,
                        thickness: mq.width * 0.0014),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Bir paketdə olan siqaret:',
                          style: TextStyle(
                            color: Styles.textColor,
                            fontSize: mq.width * 0.05,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: paket,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.right,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.045,
                            ),
                          ),
                          style: TextStyle(
                            color: Styles.numColor,
                            fontSize: mq.width * 0.045,
                          ),
                          onChanged: (paket) =>
                              setState(() => this.paket = paket),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: mq.width * 0.0139),
                    child: Divider(
                        height: mq.width * 0.004,
                        color: Styles.primaryColor,
                        thickness: mq.width * 0.0014),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Paket qiyməti:',
                          style: TextStyle(
                            color: Styles.textColor,
                            fontSize: mq.width * 0.05,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: qiymet,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.right,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0.0',
                            hintStyle: TextStyle(
                              color: Styles.numColor,
                              fontSize: mq.width * 0.045,
                            ),
                          ),
                          style: TextStyle(
                            color: Styles.numColor,
                            fontSize: mq.width * 0.045,
                          ),
                          onChanged: (qiymet) =>
                              setState(() => this.qiymet = qiymet),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: mq.width * 0.0139),
                    child: Divider(
                        height: mq.width * 0.004,
                        color: Styles.primaryColor,
                        thickness: mq.width * 0.0014),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Valyuta:',
                          style: TextStyle(
                            color: Styles.textColor,
                            fontSize: mq.width * 0.05,
                          ),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          icon: const Icon(null),
                          dropdownColor: Styles.boxColor,
                          borderRadius: BorderRadius.circular(mq.width * 0.022),
                          hint: Text(
                            valyuta[0],
                            style: TextStyle(
                              color: Styles.valColor,
                              fontSize: mq.width * 0.045,
                            ),
                          ),
                          items: valyuta.map(buildValyuta).toList(),
                          style: TextStyle(
                            color: Styles.valColor,
                            fontSize: mq.width * 0.045,
                          ),
                          onChanged: (value) =>
                              setState(() => this.value = value!),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: mq.width * 0.055),
            ElevatedButton(
              onPressed: () async {
                DateTime.now().difference(dateTime!).inMinutes >= 0
                    ? await MyBox.setTarix(dateTime!)
                    : await MyBox.setTarix(DateTime.now());
                int.tryParse(say)! > 0 ? await MyBox.setSay(say) : null;
                int.tryParse(paket)! > 0 ? await MyBox.setPaket(paket) : null;
                double.tryParse(qiymet)! >= 0
                    ? await MyBox.setQiymet(qiymet)
                    : null;
                await MyBox.setValyuta(value!);
                _showSavedToast();
                if (!mounted) return;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BottomBar(),
                    ),
                    (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.maxFinite, mq.width * 0.139),
                backgroundColor: Styles.buttonColor,
                shadowColor: Styles.shadowColor,
                shape: const StadiumBorder(),
              ),
              child: Text(
                'Yadda saxla',
                style: TextStyle(fontSize: mq.width * 0.055),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildValyuta(String valyuta) => DropdownMenuItem(
        value: valyuta,
        child: Text(valyuta),
      );

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.dark(
                surface: Styles.primaryColor,
                primary: Styles.tealColor,
                onPrimary: Styles.valColor,
                onSurface: Styles.textColor,
              ),
              dialogBackgroundColor: Styles.shadowColor,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Styles.valColor,
                ),
              ),
              textTheme: TextTheme(
                labelMedium: TextStyle(color: Styles.textColor),
              ),
            ),
            child: child!);
      });

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.dark(
                surface: Styles.shadowColor,
                onBackground: Styles.clockColor,
                primary: Styles.tealColor,
                onPrimary: Styles.valColor,
                onSurface: Styles.textColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Styles.valColor,
                ),
              ),
              textTheme: TextTheme(
                labelMedium: TextStyle(color: Styles.textColor),
              ),
            ),
            child: child!);
      });

  void _showClearAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final mq = MediaQuery.of(context).size;

          return AlertDialog(
            backgroundColor: Styles.primaryColor,
            title: Text(
              'Xatırlatma',
              style: TextStyle(
                color: Styles.valColor,
                fontSize: mq.width * 0.05,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Bütün parametrlər sıfırlanacaq',
              style: TextStyle(
                color: Styles.textColor,
                fontSize: mq.width * 0.045,
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          MyBox.clearAll();
                          _showClearToast();
                          if (!mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const BottomBar(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          'Sıfırla',
                          style: TextStyle(
                            color: Styles.alertColor,
                            fontSize: mq.width * 0.045,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Ləğv et',
                          style: TextStyle(
                            color: Styles.alertColor,
                            fontSize: mq.width * 0.045,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  void _showSavedToast() {
    Fluttertoast.showToast(
      msg: 'Yadda saxlanıldı',
      backgroundColor: Styles.toastColor,
    );
  }

  void _showClearToast() {
    Fluttertoast.showToast(
      msg: 'Parametrlər sıfırlandı',
      backgroundColor: Styles.toastColor,
    );
  }
}
