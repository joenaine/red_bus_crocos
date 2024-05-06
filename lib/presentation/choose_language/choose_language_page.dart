import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/core/utils/translation.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';

@RoutePage()
class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({super.key});

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
                        onTap: () {
                          context.setLocale(Locale(getLocale.keys.firstWhere(
                              (element) => getLocale[element] == e)));
                          context.router.maybePop();
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
