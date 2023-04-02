import 'package:hive_flutter/hive_flutter.dart';

class MyBox {
  static final Box _myBox = Hive.box('box');

  static const _keyTarix = 'siqiTarix';
  static const _keySay = 'siqiSay';
  static const _keyPaket = 'siqiPaket';
  static const _keyQiymet = 'siqiQiymet';
  static const _keyValyuta = 'siqiValyuta';
  static const _keyBildiris = 'bildiris';

  static Future setTarix(DateTime siqiTarix) async {
    final tarix = siqiTarix.toIso8601String();
    return await _myBox.put(_keyTarix, tarix);
  }

  static DateTime? getTarix() {
    final tarix = _myBox.get(_keyTarix);
    return tarix == null ? null : DateTime.tryParse(tarix);
  }

  static Future setSay(String siqiSay) async =>
      await _myBox.put(_keySay, siqiSay);

  static String? getSay() => _myBox.get(_keySay);

  static Future setPaket(String siqiPaket) async =>
      await _myBox.put(_keyPaket, siqiPaket);

  static String? getPaket() => _myBox.get(_keyPaket);

  static Future setQiymet(String siqiQiymet) async =>
      await _myBox.put(_keyQiymet, siqiQiymet);

  static String? getQiymet() => _myBox.get(_keyQiymet);

  static Future setValyuta(String siqiValyuta) async =>
      await _myBox.put(_keyValyuta, siqiValyuta);

  static String? getValyuta() => _myBox.get(_keyValyuta);

  static Future setBildiris(bool bildiris) async =>
      await _myBox.put(_keyBildiris, bildiris);

  static bool? getBildiris() => _myBox.get(_keyBildiris);

  static List<Future> clearAll() {
    final functions = <Future>[
      _myBox.delete(_keyPaket),
      _myBox.delete(_keyTarix),
      _myBox.delete(_keySay),
      _myBox.delete(_keyQiymet),
      _myBox.delete(_keyValyuta),
    ];
    return functions;
  }
}
