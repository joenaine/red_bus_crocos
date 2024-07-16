import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/application/ticket/ticket_bloc.dart';
import 'package:red_bus_crocos_project/core/constants/app_assets.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/common_scaffold_widget.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class TicketsPage extends StatelessWidget {
  TicketsPage({super.key});

  final TextEditingController _controller = TextEditingController();

  String? _ticketNumber;

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
              BlocConsumer<TicketBloc, TicketState>(
                buildWhen: (old, cur) {
                  return (cur is TicketLoaded || cur is TicketInitial);
                },
                builder: (context, state) {
                  if (state is TicketLoaded) {
                    final list = state.list;
                    if (list.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.your_tickets.tr(),
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Scaffold(
                                            appBar: AppBar(
                                              title:
                                                  Text(list[index].cardNumber),
                                            ),
                                            body: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Hero(
                                                    tag: list[index].cardNumber,
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          list[index].qrLink,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Text(list[index].category),
                                                Text(list[index].used
                                                    ? LocaleKeys.activated.tr()
                                                    : LocaleKeys.not_activated
                                                        .tr())
                                              ],
                                            ),
                                          );
                                        },
                                        fullscreenDialog: true,
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(list[index].cardNumber),
                                      const SizedBox(height: 5),
                                      Hero(
                                        tag: list[index].cardNumber,
                                        child: CachedNetworkImage(
                                            imageUrl: list[index].qrLink),
                                      )
                                    ],
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                              shrinkWrap: true,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                listener: (context, state) {
                  if (state is SFailed) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          LocaleKeys.error.tr(),
                        ),
                      ),
                    );
                  } else if (state is SLoading) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.yellow,
                        content: Text(
                          LocaleKeys.loading.tr(),
                        ),
                      ),
                    );
                  } else if (state is SSuccess) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                  }
                },
              ),
              _InfoContainer(
                  isSpecial: true,
                  title: LocaleKeys.adult_ticket.tr(),
                  price: '6000 ${LocaleKeys.tenge.tr()}'),
              const SizedBox(height: 30),
              _InfoContainer(
                title: LocaleKeys.discount_ticket.tr(),
                price: '3000 ${LocaleKeys.tenge.tr()}',
                isSpecial: true,
              ),
              const SizedBox(height: 30),
              _InfoContainer(
                  isSpecial: true,
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
              InkWell(
                onTap: () async {
                  showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(LocaleKeys.enter_ticket_number.tr()),
                        content: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              hintText: LocaleKeys.ticket_number.tr()),
                          keyboardType: TextInputType.number,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(LocaleKeys.cancel.tr()),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text(LocaleKeys.submit.tr()),
                            onPressed: () {
                              _ticketNumber = _controller.text;
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  ).then((value) async {
                    _controller.clear();
                    if (value ?? false) {
                      context
                          .read<TicketBloc>()
                          .add(CheckTicket(_ticketNumber!));
                    }
                  });
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
                          LocaleKeys.check_ticket.tr(),
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
          border: Border.all(color: Colors.grey.shade300),
          color: isSpecial ? AppColors.white : AppColors.red,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.03,
                    color: isSpecial ? AppColors.black : AppColors.white,
                    height: 1.2),
              ),
              Text(
                price,
                textAlign: TextAlign.center,
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
