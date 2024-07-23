import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/core/theme/colors.dart';

class TextSizes {
  static Widget s22w600(String text, {Color? color = Colors.white}) =>
      Text(text, style: TextStyle(fontSize: 22, color: color));
  static Widget s24w400(String text, {Color? color = Colors.white}) => Text(
      text,
      style:
          TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.w400));
  static Widget s24w500(String text, {Color? color = Colors.white}) => Text(
      text,
      style:
          TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.w500));
  static Widget s18w600(String text, {Color? color = Colors.white}) => Text(
      text,
      style:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color));
  static Widget s18w500(String text, {Color? color = Colors.white}) =>
      Text(text, style: TextStyle(fontSize: 18, color: color));
  static Widget s12w500(String text, {Color? color = Colors.white}) =>
      Text(text, style: TextStyle(fontSize: 12, color: color));
  static Widget s14w500(String text,
          {Color? color = Colors.white, TextAlign? textAlign}) =>
      Text(text,
          style: TextStyle(fontSize: 14, color: color), textAlign: textAlign);
  static Widget s14w300(String text,
          {Color? color = AppColors.red, TextAlign? textAlign}) =>
      Text(text,
          style: TextStyle(
              fontSize: 14, color: color, fontWeight: FontWeight.w300),
          textAlign: textAlign);
  static Widget s16w500(String text,
          {Color? color = Colors.white, TextAlign? textAlign}) =>
      Text(text,
          style: TextStyle(fontSize: 16, color: color), textAlign: textAlign);
}
