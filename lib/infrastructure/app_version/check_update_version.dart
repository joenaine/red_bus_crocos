import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:red_bus_crocos_project/infrastructure/app_version/app_version_repository.dart';
import 'package:red_bus_crocos_project/infrastructure/app_version/show_custom_alert.dart';
import 'package:red_bus_crocos_project/main.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;

class CheckUpdateVersion {
  static Future<void> getLatestVersion(BuildContext context) async {
    if (Platform.isIOS) {
      VersionInfoModel versionInfoModel = await AppVersion.getAppVersion();
      bool? isReleased = versionInfoModel.isReleased;

      String? versionNumber = versionInfoModel.iosVersion;
      log('$versionNumber Firebase Version');
      log('$globalVersion Device Version');
      if (globalVersion != null && versionNumber != null) {
        if (double.parse(versionNumber) > double.parse(globalVersion!) &&
            isReleased!) {
          log("global.locale.countryCode : ${global.locale.countryCode}");
          if (global.locale.languageCode == 'uk') {
            StoreUpdateAlert.show(
              context,
              title: versionInfoModel.titleKK,
              content: versionInfoModel.contentKK,
              isRequired: versionInfoModel.isRequiredIos,
            );
          }
          if (global.locale.languageCode == 'ru') {
            StoreUpdateAlert.show(context,
                title: versionInfoModel.title,
                content: versionInfoModel.content,
                isRequired: versionInfoModel.isRequiredIos);
          }
          if (global.locale.languageCode == 'en') {
            StoreUpdateAlert.show(context,
                title: versionInfoModel.titleEN,
                content: versionInfoModel.contentEN,
                isRequired: versionInfoModel.isRequiredIos);
          }
        }
      }
    }
    if (Platform.isAndroid) {
      VersionInfoModel versionInfoModel = await AppVersion.getAppVersion();
      bool? isReleased = versionInfoModel.isReleased ?? false;

      String? versionNumber = versionInfoModel.androidVersion;
      if (globalVersion != null) {
        final versionOfBack = Version.parse(versionNumber!);
        final versionOfPackage = Version.parse(globalVersion!);
        log('$versionNumber Firebase Version');
        log('$globalVersion Device Version');
        if (versionOfBack > versionOfPackage && isReleased) {
          if (global.locale.languageCode == 'uk') {
            StoreUpdateAlert.show(context,
                title: versionInfoModel.titleKK,
                content: versionInfoModel.contentKK,
                isRequired: versionInfoModel.isRequiredAndroid);
          }
          if (global.locale.languageCode == 'ru') {
            StoreUpdateAlert.show(context,
                title: versionInfoModel.title,
                content: versionInfoModel.content,
                isRequired: versionInfoModel.isRequiredAndroid);
          }
          if (global.locale.languageCode == 'en') {
            StoreUpdateAlert.show(context,
                title: versionInfoModel.titleEN,
                content: versionInfoModel.contentEN,
                isRequired: versionInfoModel.isRequiredAndroid);
          }
        }
      }
    }
  }
}
