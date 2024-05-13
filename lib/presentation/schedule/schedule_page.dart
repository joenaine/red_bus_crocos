import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/application/schedule/schedule_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/domain/schedule/schedule_dto.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/text_sizes.dart';

@RoutePage()
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  static List<String> titleColumns = [
    LocaleKeys.bus_stops,
    LocaleKeys.arrival_time,
    LocaleKeys.departure_time,
  ];
  // static List<List<String>> scheduleTableData = [
  //   [
  //     "Монумент «Астана-Байтерек»",
  //     "11:50",
  //     "12:30",
  //   ],
  //   [
  //     "Океанариум «Ailand»",
  //     "12:50",
  //     "13:05",
  //   ],
  //   [
  //     "ТРЦ «Хан Шатыр»",
  //     "13:15",
  //     "13:30",
  //   ],
  //   [
  //     "Дворец Независимости",
  //     "13:50",
  //     "14:05",
  //   ]
  // ];

  int? selectedIndex = 0;

  List<TableRow> getTableRowLap(AcfData? schedule, int selectedIndex) {
    Map<int, List<TableRow>> keyForLaps = {
      0: List.generate(
        schedule!.firstLap!.length,
        (index) {
          return TableRow(children: [
            _TableDataCell(
                title: schedule.firstLap![index].location!,
                isLastOne: index == schedule.firstLap!.length - 1),
            _TableDataCell(
                title: schedule.firstLap![index].arrivalTime!,
                isLastOne: index == schedule.firstLap!.length - 1),
            _TableDataCell(
                title: schedule.firstLap![index].departureTime!,
                isLastOne: index == schedule.firstLap!.length - 1),
          ]);
        },
      ),
      1: List.generate(
        schedule.secondLap!.length,
        (index) {
          return TableRow(children: [
            _TableDataCell(
                title: schedule.secondLap![index].location2!,
                isLastOne: index == schedule.secondLap!.length - 1),
            _TableDataCell(
                title: schedule.secondLap![index].arrivalTime2!,
                isLastOne: index == schedule.secondLap!.length - 1),
            _TableDataCell(
                title: schedule.secondLap![index].departureTime2!,
                isLastOne: index == schedule.secondLap!.length - 1),
          ]);
        },
      ),
      2: List.generate(
        schedule.thirdLap!.length,
        (index) {
          return TableRow(children: [
            _TableDataCell(
                title: schedule.thirdLap![index].location3!,
                isLastOne: index == schedule.thirdLap!.length - 1),
            _TableDataCell(
                title: schedule.thirdLap![index].arrivalTime3!,
                isLastOne: index == schedule.thirdLap!.length - 1),
            _TableDataCell(
                title: schedule.thirdLap![index].departureTime3!,
                isLastOne: index == schedule.thirdLap!.length - 1),
          ]);
        },
      ),
    };
    return keyForLaps[selectedIndex]!;
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWidget(
      appBarTitle: LocaleKeys.schedule.tr(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20, right: 20, bottom: kBottomNavigationBarHeight + 30),
        child: SingleChildScrollView(
          child: BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              return state.map(
                  initial: (_) {
                    return Center(child: TextSizes.s22w600('Loading'));
                  },
                  loaded: (value) {
                    final AcfData? schedule = value.acfData;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.svg.timer,
                              color: AppColors.red,
                              width: 29,
                              height: 29,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  LocaleKeys.travel_time.tr(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.03,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(141 / 387),
                            1: FlexColumnWidth(123 / 387),
                            2: FlexColumnWidth(123 / 387),
                          },
                          border: TableBorder(
                            borderRadius: BorderRadius.circular(16),
                            horizontalInside: const BorderSide(
                                color: AppColors.backgroundLight, width: 2),
                            verticalInside: const BorderSide(
                                color: AppColors.backgroundLight, width: 2),
                          ),
                          children: [
                            TableRow(
                              children: titleColumns
                                  .map((e) => _TableTitleCell(title: e.tr()))
                                  .toList(),
                            ),
                            ...getTableRowLap(schedule, selectedIndex!)
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => _RadioButton(
                              title: '${index + 1} круг',
                              isSelected: index == selectedIndex,
                              onTap: () {
                                setState(
                                  () {
                                    selectedIndex = index;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                  failure: (value) => const SizedBox());
            },
          ),
        ),
      ),
    );
  }
}

class _RadioButton extends StatelessWidget {
  const _RadioButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 85,
        width: 85,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42.5),
            border: Border.all(color: AppColors.red),
            color: AppColors.backgroundLight,
          ),
          child: Center(
            child: SizedBox(
              height: 75,
              width: 75,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.red : null,
                  borderRadius: BorderRadius.circular(37.5),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? AppColors.white : AppColors.red),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TableTitleCell extends StatelessWidget {
  const _TableTitleCell({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -0.03),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _TableDataCell extends StatelessWidget {
  const _TableDataCell(
      {super.key, required this.title, required this.isLastOne});

  final String title;
  final bool isLastOne;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: isLastOne
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.red,
                  letterSpacing: -0.03),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
