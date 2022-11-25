
import 'package:flutter/material.dart';
import 'package:ui_style/ui_style.dart';
class BaseTextStyle{
  BaseTextStyle._();

  static const head1Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.5,
    letterSpacing: -0.4,
  );

  static const head2Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.15,
  );

  static const head4Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.15,
  );


  static const body1Text = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: BaseColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    leadingDistribution: TextLeadingDistribution.even,
    height: 1.5,
    letterSpacing: -0.2,
  );
}