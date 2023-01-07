import 'package:flutter/material.dart';
import 'package:indi_tergit/screen/home.dart';
import 'package:indi_tergit/screen/melumat.dart';
import 'package:indi_tergit/screen/profile.dart';
import 'package:indi_tergit/screen/sagalma.dart';
import 'package:indi_tergit/utils/styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Sagalma(),
    const Melumat(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Styles.boxColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Styles.valColor,
        unselectedItemColor: Styles.textColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Styles.gaugeIconR),
              activeIcon: Icon(Styles.gaugeIconF),
              label: "Hesablama"),
          BottomNavigationBarItem(
              icon: Icon(Styles.heartIconR),
              activeIcon: Icon(Styles.heartIconF),
              label: "Sağlamlıq"),
          BottomNavigationBarItem(
              icon: Icon(Styles.infoIconR),
              activeIcon: Icon(Styles.infoIconF),
              label: "Məlumatlandırma"),
          BottomNavigationBarItem(
              icon: Icon(Styles.settingIconR),
              activeIcon: Icon(Styles.settingIconF),
              label: "Parametrlər"),
        ],
      ),
    );
  }
}
