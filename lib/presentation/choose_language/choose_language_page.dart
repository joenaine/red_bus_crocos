import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_bus_crocos_project/application/locale/locale_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/core/utils/translation.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';
import 'package:red_bus_crocos_project/presentation/home/widgets/cupertino_dialog_alert.dart';
import 'package:red_bus_crocos_project/presentation/initial_once_page.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';
import 'package:restart_app/restart_app.dart';
import 'package:red_bus_crocos_project/core/theme/theme_global_var.dart'
    as global;

@RoutePage()
class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({super.key});

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  void restartApp() {
    Restart.restartApp();
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (await hasShownPage() == false) {
          CustomCupertinoDialog.locationPermisstion(context: context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppAssets.images.redbus,
                    )))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getLocale.values
                  .map((e) => InkWell(
                        onTap: () async {
                          if (getLocaleString(context) != e) {
                            context.setLocale(Locale(getLocale.keys.firstWhere(
                                (element) => getLocale[element] == e)));
                            BlocProvider.of<LocaleBloc>(context)
                                .add(LocaleEvent.setLocale(
                              Locale(
                                getLocale.keys.firstWhere(
                                    (element) => getLocale[element] == e),
                              ),
                            ));
                            bool? isShownPage = await hasShownPage();
                            if (!isShownPage) {
                              context.router.pushAndPopUntil(
                                  const BottomNavigationRoute(),
                                  predicate: (route) => false);
                              await setShownPage();
                            }

                            if (isShownPage) restartApp();
                          } else {
                            bool? isShownPage = await hasShownPage();
                            if (!isShownPage) {
                              context.router.pushAndPopUntil(
                                  const BottomNavigationRoute(),
                                  predicate: (route) => false);
                              await setShownPage();
                            }
                            context.router.maybePop();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                              color: getLocaleString(context) == e
                                  ? AppColors.lightRed
                                  : Colors.transparent,
                              border: Border.all(color: AppColors.lightRed),
                              borderRadius: BorderRadius.circular(45)),
                          child: TextSizes.s24w400(e),
                        ),
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    ));
  }
}
