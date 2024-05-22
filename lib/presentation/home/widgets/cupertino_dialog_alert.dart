import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_bus_crocos_project/application/home/location/user_location_bloc.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';

class CustomCupertinoDialog {
  static void call(
      {required BuildContext context,
      required String content,
      required String actionText,
      void Function()? onPressed}) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(LocaleKeys.attention.tr()),
            content: Text(LocaleKeys.location_disabled.tr()),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(LocaleKeys.cancel.tr()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                onPressed: onPressed,
                child: Text(LocaleKeys.enable.tr()),
              ),
            ],
          );
        });
  }

  static void locationPermisstion({
    required BuildContext context,
  }) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(LocaleKeys.location_access.tr()),
            content: Text(LocaleKeys.location_permission.tr()),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(LocaleKeys.decline.tr()),
                onPressed: () {
                  context.router.maybePop();
                },
              ),
              CupertinoDialogAction(
                onPressed: () {
                  context.router.maybePop();
                  context
                      .read<UserLocationBloc>()
                      .add(const UserLocationEvent.getLocation());
                },
                child: Text(LocaleKeys.allow.tr()),
              ),
            ],
          );
        });
  }
}
