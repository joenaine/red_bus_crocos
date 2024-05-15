import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static Future<bool> isHuaweiDevice() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.manufacturer.toLowerCase().contains('huawei');
  }
}
