import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:red_bus_crocos_project/application/sight/sights_bloc.dart';
import 'package:red_bus_crocos_project/application/sight_detail/sight_detail_bloc.dart';
import 'package:red_bus_crocos_project/infrastructure/sights/sights_wp_repository.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/colors.dart';
import '../../domain/sight/sight_dto.dart';
import '../../generated/locale_keys.g.dart';
import '../common_widgets/common_scaffold_widget.dart';

@RoutePage()
class BusStopDetailPage extends StatefulWidget {
  const BusStopDetailPage({super.key, required this.id});

  final String id;

  @override
  State<BusStopDetailPage> createState() => _BusStopDetailPageState();
}

class _BusStopDetailPageState extends State<BusStopDetailPage> {
  static List<(String, String)> countries = [
    ('uk', AppAssets.images.kzGlobe),
    ('en', AppAssets.images.enGlobe),
    ('ru', AppAssets.images.ruGlobe),
  ];

  @override
  void initState() {
    context.read<SightDetailBloc>().add(OpenSightEvent(widget.id));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SightsWPRepository.fetchThisOne();
    });
  }

  final cardController = PageController(viewportFraction: 1 / 1.1);

  final player = AudioPlayer();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.bus_stops.tr(),
      child: BlocBuilder<SightDetailBloc, SightDetailState>(
        builder: (context, state) {
          switch (state) {
            case SightDetailInitial():
              return Center(
                  child: Text(
                LocaleKeys.loading.tr(),
              ));
            case SightDetailError():
              return Center(
                  child: Text(
                state.message ?? LocaleKeys.error.tr(),
              ));
            case SightDetailSuccess():
              {
                final SightModel data = state.data;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 29,
                              height: 29,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: AppColors.red,
                                    borderRadius: BorderRadius.circular(29)),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
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
                                child: Text(
                                  data.object_name ?? '',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.03),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: cardController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: AspectRatio(
                                aspectRatio: 351 / 200,
                                child: FullScreenWidget(
                                  disposeLevel: DisposeLevel.High,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                        fit: BoxFit.fitWidth,
                                        imageUrl: data.photos?[index] ?? ''),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Аудиогид',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 12),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xffFFEDED),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await player.play(UrlSource(
                                            'https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/Samples/AFsp/M1F1-Alaw-AFsp.wav'));
                                      },
                                      child: const Icon(
                                        Icons.play_circle_outline,
                                        color: AppColors.red,
                                        size: 37,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    const Flexible(
                                      child: Column(
                                        children: [
                                          Text('Аудиодорожка'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '02:00',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.red),
                                              ),
                                              Text(
                                                '07:00',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.red),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: List.generate(
                                countries.length,
                                (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: selectedIndex == index
                                        ? AppColors.red
                                        : AppColors.backgroundLight,
                                    radius: 25,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          AppColors.backgroundLight,
                                      radius: 20,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(countries[index].$2),
                                        radius: 17.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              data.description ?? '',
                              style: const TextStyle(
                                  fontSize: 16, letterSpacing: -0.03),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
