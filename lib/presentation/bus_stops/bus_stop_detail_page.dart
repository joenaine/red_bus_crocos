import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/colors.dart';
import '../../generated/locale_keys.g.dart';
import '../common_widgets/common_scaffold_widget.dart';
import 'models.dart';

@RoutePage()
class BusStopDetailPage extends StatefulWidget {
  const BusStopDetailPage({super.key});

  @override
  State<BusStopDetailPage> createState() => _BusStopDetailPageState();
}

class _BusStopDetailPageState extends State<BusStopDetailPage> {
  static List<(String, String)> countries = [
    ('ru', AppAssets.images.ruGlobe),
    ('kz', AppAssets.images.kzGlobe),
    ('en', AppAssets.images.enGlobe),
  ];

  final player = AudioPlayer();
  int selectedIndex = 0;

  Future<ObjectModel> fetchThisOne() async {

    try {
      final client = Dio();
      final result = await client
          .post('https://ais.citypass.kz/app/v1/objects/data', data: {
        "api_key": "rTD6psMNcuMfewz8YAv825X",
        "project_id": "1",
        "lang": "ru",
        "object_id": "17",

      });

      if (result.statusCode == 200) {
        return ObjectModel.fromMap(result.data["data"]);
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
      child: FutureBuilder<ObjectModel>(
        future: fetchThisOne(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final ObjectModel data= snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
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
                                '1',
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
                            child: Text(
                              data.object_name??'',
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
                    child: ListView.builder(
                      physics: const PageScrollPhysics(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                          EdgeInsets.only(left: index == 0 ? 20 : 0, right: 5),
                          child: AspectRatio(
                            aspectRatio: 351 / 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                data.photos?[index]??''
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
                        Text(
                          'Аудиогид',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                                  onTap: ()async{
                                    print('adw');
                                    await player.play(UrlSource('https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/Samples/AFsp/M1F1-Alaw-AFsp.wav'));
                                    print('gfda');
                                    },
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    color: AppColors.red,
                                    size: 37,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Flexible(
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
                                  backgroundColor: AppColors.backgroundLight,
                                  radius: 20,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(countries[index].$2),
                                    radius: 17.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(data.description??'',
                          style: const TextStyle(fontSize: 16, letterSpacing: -0.03),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
      
          }else{
            return const Center(child: Text('Loading'),);
          }
        }
      ),
    );
  }
}
