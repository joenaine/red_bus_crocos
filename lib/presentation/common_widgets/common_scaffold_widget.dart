import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/core/utils/translation.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/indents.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';

class CommonScaffoldWidget extends StatelessWidget {
  const CommonScaffoldWidget({super.key, this.appBarTitle = '', this.child});

  final String? appBarTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(appBarTitle!),
        actions: [
          InkWell(
            onTap: () {
              context.router.push(const ChooseLanguageRoute());
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 85,
              height: 50,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(90)),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.svg.globe),
                  Indent.w4(),
                  TextSizes.s14w300(getLocaleString(context)),
                ],
              ),
            ),
          )
        ],
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
