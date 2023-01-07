import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Styles {
  //colors
  static MaterialColor themeColor = Colors.teal;
  static Color primaryColor = Colors.blueGrey[900]!;
  static Color boxColor = Colors.blueGrey[800]!;
  static Color textColor = Colors.white70;
  static Color valColor = Colors.white;
  static Color numColor = Colors.lime[100]!;
  static Color iconColor = Colors.greenAccent;
  static Color icon2Color = Colors.blue[700]!;
  static Color shadowColor = Colors.grey[900]!;
  static Color buttonColor = Colors.teal[900]!;
  static Color progressColor = Colors.green[700]!;
  static Color tealColor = Colors.teal;
  static Color clockColor = Colors.lightBlue[300]!;
  static Color toastColor = Colors.black87;
  static Color alertColor = Colors.red[200]!;

  //styles
  static TextStyle headLine = TextStyle(
    color: textColor,
    fontSize: 20,
  );
  static TextStyle textStyle = TextStyle(
    color: textColor,
    fontSize: 18,
  );
  static TextStyle textStyle2 = TextStyle(
    color: textColor,
    fontSize: 16,
  );
  static TextStyle numStyle = TextStyle(
    color: numColor,
    fontSize: 18,
  );
  static TextStyle numStyle2 = TextStyle(
    color: numColor,
    fontSize: 16,
  );

  //icons
  static IconData quitIcon = Icons.smoke_free_sharp;
  static IconData infoIcon = Icons.info_outline_rounded;
  static IconData docIcon = FluentIcons.search_info_24_regular;
  static IconData pulseIcon = FluentIcons.pulse_28_regular;
  static IconData dataIcon = FluentIcons.data_histogram_24_regular;
  static IconData errorIcon = FluentIcons.error_circle_24_filled;
  static IconData resetIcon = FluentIcons.arrow_clockwise_32_filled;
  static IconData gaugeIconR = FluentIcons.gauge_32_regular;
  static IconData gaugeIconF = FluentIcons.gauge_32_filled;
  static IconData heartIconR = FluentIcons.heart_pulse_32_regular;
  static IconData heartIconF = FluentIcons.heart_pulse_32_filled;
  static IconData infoIconR =FluentIcons.book_information_24_regular;
  static IconData infoIconF =FluentIcons.book_information_24_filled;
  static IconData settingIconR = FluentIcons.settings_32_regular;
  static IconData settingIconF = FluentIcons.settings_32_filled;
}
