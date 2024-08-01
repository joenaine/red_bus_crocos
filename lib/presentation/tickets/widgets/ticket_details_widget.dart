import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_bus_crocos_project/application/ticket/ticket_bloc.dart';
import 'package:red_bus_crocos_project/generated/locale_keys.g.dart';

class TicketDetailsWidget extends StatelessWidget {
  const TicketDetailsWidget(
      {super.key, required this.ticket, required this.isOffline});
  final Ticket ticket;
  final bool isOffline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(bottom: 12, left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 4),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: ticket.getStatusColor(ticket.status.toString()),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              ticket.getStatus(ticket.status.toString()),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 30),
          RowInfo(
            isOffline: isOffline,
            svg: 'assets/icons/credit-card2.svg',
            title: LocaleKeys.Card_number.tr(),
            info: ticket.cardNumber,
          ),
          RowInfo(
            isOffline: isOffline,
            svg: 'assets/icons/calendar.svg',
            title: LocaleKeys.Validity.tr(),
            info: ticket.duration != '0' &&
                    ticket.duration != null &&
                    ticket.duration != 'null'
                ? '${ticket.duration} ${LocaleKeys.hours.tr()}'
                : '-',
          ),
          RowInfo(
            isOffline: isOffline,
            svg: 'assets/icons/clock.svg',
            title: LocaleKeys.Time_left.tr(),
            info: ticket.minLeft != 0 ? '${ticket.minLeft}' : '-',
          ),
          RowInfo(
            isOffline: isOffline,
            svg: 'assets/icons/user.svg',
            title: LocaleKeys.Card_type.tr(),
            info: ticket.category,
          ),
          RowInfo(
            isOffline: isOffline,
            svg: 'assets/icons/qr-code2.svg',
            title: LocaleKeys.QR_to_show.tr(),
            info: ticket.qrLink,
            isQR: true,
          )
        ],
      ),
    );
  }
}

class RowInfo extends StatefulWidget {
  const RowInfo({
    super.key,
    required this.svg,
    required this.title,
    required this.info,
    this.isQR = false,
    required this.isOffline,
  });

  final String svg;
  final String title;
  final String info;
  final bool isQR;
  final bool isOffline;

  @override
  State<RowInfo> createState() => _RowInfoState();
}

class _RowInfoState extends State<RowInfo> {
  late File imageData;
  bool _isImageLoaded = false;
  void _asyncMethod() async {
    imageData = await CacheManager(
      Config(
        'customCacheKey',
        stalePeriod: const Duration(days: 99999),
        maxNrOfCacheObjects: 99999,
      ),
    ).getSingleFile(widget.info);
    setState(() {
      _isImageLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isQR) {
      _asyncMethod();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isQR) {
      return Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(widget.svg),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          widget.isOffline
              ? _isImageLoaded
                  ? GestureDetector(
                      onTap: () {
                        _navigateToImage(context, imageData);
                      },
                      child: Hero(
                        tag: imageData.path,
                        child: Image.file(
                          imageData,
                          width: 80,
                          height: 80,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    )
                  : const SizedBox()
              : GestureDetector(
                  onTap: () {
                    _navigateToImage(context, widget.info);
                  },
                  child: Hero(
                    tag: widget.info,
                    child: CachedNetworkImage(
                      imageUrl: widget.info,
                      width: 80,
                      height: 80,
                      alignment: Alignment.centerRight,
                      errorWidget: (context, object, stackTrace) {
                        return Image.asset(
                          'assets/images/placeholder.png',
                          width: 80,
                          height: 80,
                          alignment: Alignment.centerRight,
                        );
                      },
                    ),
                  ),
                ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 10),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(widget.svg),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.info,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 10),
        ],
      );
    }
  }

  Future<dynamic> _navigateToImage(BuildContext context, photo) {
    return Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.white,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return PhotoHero(photo: photo, isOffline: widget.isOffline);
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SizeTransition(
            sizeFactor: animation,
            child: child,
          );
        },
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    required this.isOffline,
  });
  final dynamic photo;
  final bool isOffline;

  @override
  Widget build(BuildContext context) {
    if (isOffline) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        onVerticalDragEnd: (details) {
          Navigator.of(context).pop();
        },
        onHorizontalDragEnd: (details) {
          Navigator.of(context).pop();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Center(
            child: Hero(
              tag: photo.path,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Image.file(
                    photo,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        onVerticalDragEnd: (details) {
          Navigator.of(context).pop();
        },
        onHorizontalDragEnd: (details) {
          Navigator.of(context).pop();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Center(
            child: Hero(
              tag: photo,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: CachedNetworkImage(
                  imageUrl: photo,
                  fit: BoxFit.contain,
                  errorWidget: (context, object, stackTrace) {
                    return Image.asset(
                      'assets/images/placeholder.png',
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
