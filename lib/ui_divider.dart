import 'base_color.dart';
import 'package:flutter/material.dart';

class UiDividerWithText extends StatelessWidget {
  const UiDividerWithText(
      {Key? key,
      required this.title,
      this.textStyle,
      this.color,
      this.height,
      this.thickness,
      this.paddingStart,
      this.paddingEnd,
      this.textPaddingStart,
      this.textPaddingEnd})
      : super(key: key);

  final String title;
  final TextStyle? textStyle;
  final Color? color;
  final double? height;
  final double? thickness;
  final double? paddingStart;
  final double? paddingEnd;
  final double? textPaddingStart;
  final double? textPaddingEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                height: height ?? 16,
                indent: paddingStart ?? 0,
                endIndent: textPaddingStart ?? 24,
                thickness: thickness ?? 0,
                color: color ?? BaseColors.greyColor,
              ),
            ),
            Text(
              title,
              style: textStyle ??
                  const TextStyle(
                    color: BaseColors.greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    leadingDistribution: TextLeadingDistribution.even,
                    height: 1.5,
                    letterSpacing: -0.2,
                  ),
            ),
            Expanded(
              child: Divider(
                height: height ?? 16,
                indent: textPaddingEnd ?? 24,
                endIndent: paddingEnd ?? 0,
                thickness: thickness ?? 0,
                color: color ?? BaseColors.greyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
