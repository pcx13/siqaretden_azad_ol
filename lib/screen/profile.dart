import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indi_tergit/data/my_box.dart';
import 'package:indi_tergit/screen/bottom_bar.dart';
import 'package:indi_tergit/utils/styles.dart';

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
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Siqareti\nburaxdığınız tarix:',
                      style: Styles.textStyle,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: pickDateTime,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${dateTime!.day}.${dateTime!.month.toString().padLeft(2, '0')}.${dateTime!.year}',
                                  style: Styles.numStyle2,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  '${dateTime!.hour.toString().padLeft(2, '0')}:${dateTime!.minute.toString().padLeft(2, '0')}',
                                  style: Styles.numStyle2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                      height: 1.5, color: Styles.primaryColor, thickness: 0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bir gündə\nçəkilən siqaret:',
                      style: Styles.textStyle,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: say,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.right,
                        inputFormatters: [LengthLimitingTextInputFormatter(4)],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: Styles.numStyle2,
                          border: InputBorder.none,
                        ),
                        style: Styles.numStyle2,
                        onChanged: (say) => setState(() => this.say = say),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                      height: 1.5, color: Styles.primaryColor, thickness: 0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bir paketdə\nolan siqaret:',
                      style: Styles.textStyle,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: paket,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.right,
                        inputFormatters: [LengthLimitingTextInputFormatter(4)],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: Styles.numStyle2,
                        ),
                        style: Styles.numStyle2,
                        onChanged: (paket) =>
                            setState(() => this.paket = paket),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                      height: 1.5, color: Styles.primaryColor, thickness: 0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paket qiyməti:',
                      style: Styles.textStyle,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: qiymet,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.right,
                        inputFormatters: [LengthLimitingTextInputFormatter(5)],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0.0',
                          hintStyle: Styles.numStyle2,
                        ),
                        style: Styles.numStyle2,
                        onChanged: (qiymet) =>
                            setState(() => this.qiymet = qiymet),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                      height: 1.5, color: Styles.primaryColor, thickness: 0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valyuta:',
                      style: Styles.textStyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        icon: const Icon(null),
                        dropdownColor: Styles.boxColor,
                        borderRadius: BorderRadius.circular(8),
                        hint: Text(
                          valyuta[0],
                          style: Styles.textStyle2
                              .copyWith(color: Styles.valColor),
                        ),
                        items: valyuta.map(buildValyuta).toList(),
                        style:
                            Styles.textStyle2.copyWith(color: Styles.valColor),
                        onChanged: (value) =>
                            setState(() => this.value = value!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
              backgroundColor: Styles.buttonColor,
              shadowColor: Styles.shadowColor,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.all(12),
            ),
            child: const Text(
              'Yadda saxla',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
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
          return AlertDialog(
            backgroundColor: Styles.primaryColor,
            title: Text(
              'Xatırlatma',
              style: Styles.textStyle.copyWith(color: Styles.valColor),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Bütün parametrlər sıfırlanacaq',
              style: Styles.textStyle2,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextButton(
                        onPressed: () async {
                          await MyBox.clearAll();
                          _showClearToast();
                          if (!mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const BottomBar(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size.fromWidth(100),
                        ),
                        child: Text(
                          'Sıfırla',
                          style: Styles.textStyle2
                              .copyWith(color: Styles.alertColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                            fixedSize: const Size.fromWidth(100)),
                        child: Text(
                          'Ləğv et',
                          style: Styles.textStyle2
                              .copyWith(color: Styles.alertColor),
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
