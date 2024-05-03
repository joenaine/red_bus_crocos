import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:red_bus_crocos_project/presentation/routes/router.dart';

import '../../core/constants/app_assets.dart';
import 'bus_stop_detail_page.dart';
import 'models.dart';

@RoutePage()
class BusStopsPage extends StatelessWidget {
  const BusStopsPage({super.key});

  Future<List<CategoriesModel>> fetchCategories() async {
    try {
      final client = Dio();
      final result = await client
          .post('https://ais.citypass.kz/app/v1/objects/cat-list', data: {
        "api_key": "rTD6psMNcuMfewz8YAv825X",
        "project_id": "1",
        "lang": "ru"
      });

      if (result.statusCode == 200) {
        List sortedList = [];
        sortedList
            .addAll((result.data['data']['categories'] as List).getRange(0, 2));

        sortedList
            .addAll((result.data['data']['categories'] as List).getRange(3, 4));

        return sortedList
            .map((route) => CategoriesModel.fromMap(route))
            .toList();
      } else {
        throw Exception('Error on fetchCategories: ${result.statusCode}');
      }
    } on Exception catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.bus_stops.tr(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: FutureBuilder<List<CategoriesModel>>(
            future: fetchCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final CategoriesModel category = snapshot.data!.first;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = category.objects![index];
                    return BusStopItemWidget(
                        onTap: () {
                          context.router.push(const BusStopDetailRoute());
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
                  itemCount: category.objects?.length ?? 0,
                );
              } else {
                return const Center(
                  child: Text('Empty'),
                );
              }
            }),
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
                          color: AppColors.white, fontSize: 24, height: 1.2),
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
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.03),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              SvgPicture.asset(AppAssets.svg.arrowRight)
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            style: const TextStyle(letterSpacing: -0.03),
          )
        ],
      ),
    );
  }
}
