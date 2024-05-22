import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/presentation/bus_stops/widgets/bus_stops_shimmer.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';

import '../../application/sight/sights_bloc.dart';
import '../../core/constants/app_assets.dart';
import '../../domain/sight/sight_dto.dart';

@RoutePage()
class BusStopsPage extends StatelessWidget {
  const BusStopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.bus_stops.tr(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 100,
        ),
        child: BlocBuilder<SightsBloc, SightsState>(
          builder: (context, state) {
            switch (state) {
              case SightsInitial():
                return const BusStopsShimmerWidget();
              case SightsError():
                return Center(
                  child: Text(LocaleKeys.error.tr()),
                );
              case SightsLoaded():
                {
                  final List<SightModel> sights = state.data;
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = sights[index];
                      return BusStopItemWidget(
                          onTap: () {
                            context.router
                                .push(BusStopDetailRoute(id: data.obj_id!));
                          },
                          index: index,
                          title: data.object_name ?? '',
                          imageUrl: data.obj_img ?? '',
                          subTitle: data.popup_description ?? '');
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: sights.length ?? 0,
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

class BusStopItemWidget extends StatelessWidget {
  const BusStopItemWidget(
      {super.key,
      required this.index,
      required this.title,
      required this.imageUrl,
      required this.subTitle,
      required this.onTap});

  final int index;
  final String imageUrl;
  final String title;
  final String subTitle;
  final void Function() onTap;

  String get num => (index + 1).toString();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 0) const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: AspectRatio(
              aspectRatio: 390 / 198,
              child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                imageUrl: imageUrl,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    SizedBox(
                      width: 29,
                      height: 29,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(29)),
                        child: Center(
                          child: Text(
                            num,
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                                height: 1.2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(AppAssets.svg.arrowRight)
            ],
          ),
          const SizedBox(height: 10),
          // Text(
          //   subTitle,
          //   style: const TextStyle(letterSpacing: -0.03),
          // )
        ],
      ),
    );
  }
}
