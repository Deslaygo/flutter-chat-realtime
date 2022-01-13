import 'dart:io';

class Environment {
  static String apiUrl =
      Platform.isAndroid ? '192.168.0.152:3000/api' : '192.168.0.152:3000/api';
  static String socketUrl =
      Platform.isAndroid ? '192.168.0.152:3000' : '192.168.0.152:3000';
}
