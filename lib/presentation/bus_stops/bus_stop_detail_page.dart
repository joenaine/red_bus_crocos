import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:red_bus_crocos_project/application/sight_detail/sight_detail_bloc.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/indents.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/colors.dart';
import '../../domain/sight/sight_dto.dart';
import '../../generated/locale_keys.g.dart';
import '../common_widgets/common_scaffold_widget.dart';

@RoutePage()
class BusStopDetailPage extends StatefulWidget {
  const BusStopDetailPage({super.key, required this.id, required this.index});

  final String id;
  final int index;

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
  }

  final cardController = PageController(viewportFraction: 1 / 1.1);

  // final player = AudioPlayer();
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
                                child: Center(
                                  child: Text(
                                    widget.index.toString(),
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
                                child: InstaImageViewer(
                                  disposeLevel: DisposeLevel.high,
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
                            // const Text(
                            //   'Аудиогид',
                            //   style: TextStyle(
                            //       fontSize: 20, fontWeight: FontWeight.w600),
                            // ),
                            const SizedBox(height: 12),
                            // DecoratedBox(
                            //   decoration: BoxDecoration(
                            //     color: const Color(0xffFFEDED),
                            //     borderRadius: BorderRadius.circular(15),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(20),
                            //     child: Row(
                            //       children: [
                            //         InkWell(
                            //           onTap: () async {
                            //             //TODO: AUDIO
                            //             // await player.play(UrlSource(
                            //             // 'https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/Samples/AFsp/M1F1-Alaw-AFsp.wav'));
                            //           },
                            //           child: const Icon(
                            //             Icons.play_circle_outline,
                            //             color: AppColors.red,
                            //             size: 37,
                            //           ),
                            //         ),
                            //         const SizedBox(width: 15),
                            //         const Flexible(
                            //           child: Column(
                            //             children: [
                            //               Text('Аудиодорожка'),
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     '02:00',
                            //                     style: TextStyle(
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.w600,
                            //                         color: AppColors.red),
                            //                   ),
                            //                   Text(
                            //                     '07:00',
                            //                     style: TextStyle(
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.w600,
                            //                         color: AppColors.red),
                            //                   ),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 12),
                            // Row(
                            //   children: List.generate(
                            //     countries.length,
                            //     (index) => InkWell(
                            //       onTap: () {
                            //         setState(() {
                            //           selectedIndex = index;
                            //         });
                            //       },
                            //       child: CircleAvatar(
                            //         backgroundColor: selectedIndex == index
                            //             ? AppColors.red
                            //             : AppColors.backgroundLight,
                            //         radius: 25,
                            //         child: CircleAvatar(
                            //           backgroundColor:
                            //               AppColors.backgroundLight,
                            //           radius: 20,
                            //           child: CircleAvatar(
                            //             backgroundImage:
                            //                 AssetImage(countries[index].$2),
                            //             radius: 17.5,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 25),
                            // HtmlWidget(data.description ?? '')
                            Text(
                              widget.index == 4
                                  ? textIndexFour()
                                  : data.description ?? '',
                              style: const TextStyle(
                                  fontSize: 16, letterSpacing: -0.03),
                            ),
                            Indent.h16()
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

String textIndexFour() {
  return '''Идея создания единственного в своем роде парка динозавров принадлежала президенту РК Н.А. Назарбаеву. Открытие динопарка состоялось 6 июля 2008 года – в День столицы (Астаны), именно в этот праздничный день «Джунгли» впервые открыли свои двери для посетителей.
      
      Парк динозавров в Астане стал уникальным проектом, не имеющим аналогов в СНГ. В нем удивительным образом сочетаются театральные представления и увлекательное путешествие по недрам джунглей с роботами-динозаврами и катанием на водных горках.
      
      Роботы-аниматрониксы для динопарка были разработаны и созданы в Казахстане, отечественной компанией «Казахстан Салют», главным конструктором машин выступил Вадим Гостев. Этот факт придает еще большей уникальности аттракциону, ведь впервые аниматрониксы создавались на территории Республики.
      
      Парк аниматрониксов «Джунгли» предлагает Вам окунуться в атмосферу непроходимых джунглей и прогуляться среди огромных доисторических животных. Динопарк в Астане стал крупнейшим проектом Республики, воссоздавший в себе всю красоту и таинственность джунглей. Захватывающие приключения в затерянном мире, которые Вы могли наблюдать в голливудских фильмах, теперь доступны абсолютно всем. Таинственный мир джунглей очарует и увлечет Вас с первых минут. Опытные гиды и аниматоры проведут для Вас веселую, интересную и познавательную экскурсию в загадочный парк динозавров, с его доисторическими обитателями, попутно рассказывая истории, пришедшие к нам с древних времен.
      
      Динозавры, трицерапторы, тираннозавры, первобытные племена – вся атмосфера динопарка пропитана волнительным духом джунглей, погрузившись в которую Вы забудете обо все на свете, и поверите, что представленная реальность действительна.
      
      Расположившись в здании РЦ «Ailand», динопарк занимает более 3000 м2 площади, которая густо заселена различными обитателями флоры и фауны диких джунглей.
      
      На входе в театр аниматрониксов Вас встретит огромное каменное лицо древнего божества, которое оживет на Ваших глазах и, завораживая своим магическим взглядом, уведет Вас в заросли джунглей. Пройдя в образовавшуюся щель, Вы окажитесь в настоящей пещере. Здесь Вас встретит огромный паук с множеством гигантских и мохнатых лап, который не упустит возможности Вас напугать, вокруг него уже собралось множество маленьких пауков, они вот-вот поползут па Вам. Пройдя дальше, Вы наткнетесь на двух огромных 5-ти метровых крокодила, ждущих свою добычу на берегу реки. Пройдет по мостику Вы наткнетесь на гигантских лягушек и мифического Горгония, весело отплясывающих под зажигательную музыку.
      
      Узкий проход открывает Вам новую пещеру, где из темноты взгляд выхватывает блеск глаз короля мелового периода - Тираннозавра, огромный монстр, ростом более 3,5 метров освящен вспышками молний. Незабываемые впечатления оставят встречи с гигантскими фигурами Гориллы и Трицератопса. Поднявшись по мосту Вы сможете с высоты понаблюдать за жизнью Птеродактиля и Диплодоков. Особое внимание туристов приковывает пещера сталактитов, сталагмитов и драгоценных камней. А под сводами пещеры уже притаились тысячи летучих мышей. Вы пройдете по шаткому и грохочущему мосту, нависшему над кратером вулкана. Весь Ваш путь сопровождает пение птиц и рев невидимых животных. В конце путешествия Вы окажетесь в заброшенном и таинственном городе древнейших цивилизаций, где на сцене древнего амфитеатра перед Вами развернуться театральные представления.
      
      Театр аниматрониксов поражает не только детей, но и взрослых. Придя сюда однажды, хочется повторить увлекательное путешествие еще много раз!''';
}
