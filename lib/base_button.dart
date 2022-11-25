
import 'package:flutter/material.dart';
import 'package:ui_style/ui_style.dart';

class BaseButton extends StatelessWidget {
  final String? text;
  final bool isActive;
  final Color? bgColor;
  final Color? splashColor;
  final Color? borderColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? minWidth;
  final double? height;
  final double? padding;
  final EdgeInsets? customPadding;
  final EdgeInsets? customPaddingEdge;
  final VoidCallback onTap;
  final Widget? btnWidget;

  const BaseButton({
    Key? key,
    this.text,
    this.isActive = true,
    this.bgColor,
    this.splashColor,
    this.borderColor,
    this.borderRadius,
    this.textStyle,
    this.textColor,
    this.fontSize,
    this.minWidth,
    this.width,
    this.height,
    this.padding,
    required this.onTap,
    this.customPadding,
    this.customPaddingEdge,
    this.btnWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1.0 : 0.4,
      child: Container(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 120.0,
        ),
        padding: customPaddingEdge,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? _getButtonBorderColor(),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        child: Material(
          color: bgColor ?? _getButtonColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          child: InkWell(
            onTap: isActive ? onTap : null,
            splashColor: BaseColors.primaryColor,
            highlightColor: _getHighlightColor(),
            splashFactory: NoSplash.splashFactory,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: customPadding ?? (EdgeInsets.all(padding ?? 10.0)),
                child: _getWidgetBtn(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Color _getTextColor() {
    if (isActive) {
      return (textColor != null) ? textColor! : BaseColors.greyColor;
    }
    return BaseColors.greyColor;
  }

  Color _getButtonColor() {
    return isActive ? BaseColors.primaryColor : BaseColors.greyColor;
  }

  Color _getButtonBorderColor() {
    return isActive ? Colors.transparent : BaseColors.primaryColor;
  }

  Color _getHighlightColor() {
    if (isActive) {
      return (bgColor != null) ? bgColor! : BaseColors.primaryColor;
    }
    return Colors.transparent;
  }

  Widget _getWidgetBtn() {
    final textWidget = Text(
      text ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );

    if (btnWidget != null && text != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          btnWidget!,
          textWidget,
        ],
      );
    } else if (btnWidget != null && text == null) {
      return btnWidget!;
    } else {
      return textWidget;
    }
  }
}
