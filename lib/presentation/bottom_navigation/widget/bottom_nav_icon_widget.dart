import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationIconWidget extends StatelessWidget {
  const BottomNavigationIconWidget({
    super.key,
    required this.svgPath,
    this.isSelected = false,
  });
  final String svgPath;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        height: 57,
        width: 57,
        decoration: BoxDecoration(
            color: isSelected!
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(100)),
        child: SvgPicture.asset(svgPath));
  }
}
