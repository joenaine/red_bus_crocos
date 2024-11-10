import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreUpdateAlert {
  static void show(BuildContext context,
      {String? title = 'Новая версия!',
      String? content,
      bool? isRequired = false,
      String? androidLink,
      String? iosLink}) {
    String getAppUrl() {
      if (Platform.isAndroid) {
        return androidLink != null && androidLink.isNotEmpty
            ? androidLink
            : 'https://play.google.com/store/apps/details?id=com.crocos.kaf';
      } else {
        return iosLink != null && iosLink.isNotEmpty
            ? iosLink
            : 'https://apps.apple.com/kz/app/kazagrofinance/id6477376284';
      }
    }

    if (Platform.isAndroid) {
      showDialog(
        barrierDismissible: isRequired == false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title!),
            content: Text(content ?? ''),
            actions: <Widget>[
              if (!isRequired!)
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(LocaleKeys.decline.tr(),
                        style: const TextStyle(color: AppColors.red)),
                  ),
                  onPressed: () {
                    AutoRouter.of(context).maybePop();
                  },
                ),
              TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(LocaleKeys.update.tr(),
                      style: const TextStyle(color: AppColors.red)),
                ),
                onPressed: () {
                  UrlL.openUrl(getAppUrl());
                },
              ),
            ],
          );
        },
      );
    }
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(title!),
              content: Text(content ?? ''),
              actions: <Widget>[
                if (!isRequired!)
                  CupertinoDialogAction(
                    child: Text(LocaleKeys.decline.tr()),
                    onPressed: () {
                      AutoRouter.of(context).maybePop();
                    },
                  ),
                CupertinoDialogAction(
                  onPressed: () {
                    UrlL.openUrl(getAppUrl());
                  },
                  child: Text(LocaleKeys.update.tr()),
                ),
              ],
            );
          });
    }
  }
}

class UrlL {
  static Future<void> openUrl(String url) async {
    final parsUrl = Uri.parse(url);
    if (!await launchUrl(parsUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $parsUrl';
    }
  }
}
