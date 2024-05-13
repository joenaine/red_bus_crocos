import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.tickets.tr(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20, right: 20, bottom: kBottomNavigationBarHeight + 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              _InfoContainer(
                  title: LocaleKeys.adult_ticket.tr(),
                  price: '5000 ${LocaleKeys.tenge.tr()}'),
              const SizedBox(height: 30),
              _InfoContainer(
                title: LocaleKeys.discount_ticket.tr(),
                price: '3000 ${LocaleKeys.tenge.tr()}',
                isSpecial: true,
              ),
              const SizedBox(height: 30),
              _InfoContainer(
                  title: LocaleKeys.child_under_six.tr(),
                  price: LocaleKeys.free),
              const SizedBox(height: 30),
              InkWell(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      'https://astana.citypass.kz/ru/kupit-citypass/'))) {
                    throw Exception('Could not launch https://flutter.dev');
                  }
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: AppColors.red),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.buy_ticket.tr(),
                          style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.2),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          AppAssets.svg.ticket,
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoContainer extends StatelessWidget {
  const _InfoContainer({
    super.key,
    required this.title,
    this.isSpecial = false,
    required this.price,
  });

  final String title;
  final String price;
  final bool isSpecial;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: isSpecial ? AppColors.white : AppColors.red,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.03,
                    color: isSpecial ? AppColors.black : AppColors.white,
                    height: 1.2),
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.03,
                    color: isSpecial ? AppColors.black : AppColors.white,
                    height: 1.2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
