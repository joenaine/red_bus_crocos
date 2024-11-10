import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/presentation/common_widgets/indents.dart';

class BusStopsShimmerWidget extends StatelessWidget {
  const BusStopsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Indent.h16(),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  FadeShimmer(
                      radius: 15,
                      highlightColor: const Color(0xffF9F9FB),
                      baseColor: const Color(0xffE6E8EB),
                      width: size.width,
                      height: 200),
                  Indent.h8(),
                  FadeShimmer(
                      radius: 15,
                      highlightColor: const Color(0xffF9F9FB),
                      baseColor: const Color(0xffE6E8EB),
                      width: size.width,
                      height: 30),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Indent.h12();
            },
          ),
        ],
      ),
    );
  }
}
