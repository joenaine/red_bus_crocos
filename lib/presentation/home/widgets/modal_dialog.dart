import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';

class ModalDialog {
  static void show(
    BuildContext context, {
    String? title = 'Внимание!',
    String? content,
  }) {
    if (Platform.isAndroid) {
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 19,
            backgroundColor: AppColors.red,
            titlePadding: EdgeInsets.zero,
            title: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: IconButton(
                      // borderRadius: BorderRadius.circular(100),
                      icon: SvgPicture.asset(AppAssets.svg.cancel, height: 44),
                      onPressed: () {
                        context.router.maybePop();
                      },
                    )),
                TextSizes.s24w500(title ?? ''),
              ],
            ),
            content:
                TextSizes.s16w500(content ?? '', textAlign: TextAlign.center),
            actions: const [
              // TextButton(
              //   child: const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child:
              //         Text('Обновить', style: TextStyle(color: AppColors.red)),
              //   ),
              //   onPressed: () {
              //     context.router.maybePop();
              //   },
              // ),
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
              actions: const <Widget>[
                // if (!isRequired!)
                //   CupertinoDialogAction(
                //     child: const Text('Назад'),
                //     onPressed: () {
                //       context.router.maybePop();
                //     },
                //   ),
                // CupertinoDialogAction(
                //   onPressed: () {},
                //   child: const Text('Обновить'),
                // ),
              ],
            );
          });
    }
  }
}
