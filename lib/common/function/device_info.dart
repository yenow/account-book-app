import 'dart:io';

import 'package:account_book/common/object/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import '../log_config.dart';

Future<DeviceInfo> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  DeviceInfo deviceData = DeviceInfo();

  try {
    dlog.i('Platform.isAndroid = ${Platform.isAndroid}');
    if (Platform.isAndroid) {
      deviceData = _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
  } catch (error) {
    error.printError();
  }

  dlog.d(deviceData);
  return deviceData;
}

DeviceInfo _readAndroidDeviceInfo(AndroidDeviceInfo info) {
  var release = info.version.release;
  var sdkInt = info.version.sdkInt;
  var manufacturer = info.manufacturer;
  var model = info.model;

  return DeviceInfo(
    platform: 'android',
    version: "android $release (SDK $sdkInt)",
    device: "$manufacturer $model",
  );
}

DeviceInfo _readIosDeviceInfo(IosDeviceInfo info) {
  var systemName = info.systemName;
  var version = info.systemVersion;
  var machine = info.utsname.machine;

  return DeviceInfo(
    platform: 'ios',
    version: "$systemName $version",
    device: machine,
  );
}
