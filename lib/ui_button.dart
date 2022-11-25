import 'base_color.dart';
import 'package:flutter/material.dart';

enum ButtonType { primaryBtn, secondaryBtn }

class UiButton extends StatefulWidget {
  final String title;
  final ButtonType buttonType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Color? backgroundColor;
  final bool? isSmall;
  final double? width;
  final double? height;
  final bool? isDisable;
  final TextStyle? textStyle;
  final double? fontSize;
  final VoidCallback? onPress;
  final double? borderRadius;

  const UiButton({
    Key? key,
    required this.title,
    required this.buttonType,
    this.backgroundColor,
    this.onPress,
    this.width,
    this.height,
    this.textStyle,
    this.isDisable,
    this.isSmall,
    this.borderRadius,
    this.fontSize,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<UiButton> createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  @override
  Widget build(BuildContext context) {
    bool clickEnable = true;
    bool isPrimary = true;

    if (widget.isDisable != null) {
      clickEnable = !clickEnable;
    }

    if (widget.buttonType == ButtonType.secondaryBtn) {
      isPrimary = !isPrimary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      child: SizedBox(
        width: widget.isSmall != null
            ? null
            : widget.width ?? MediaQuery.of(context).size.width / 1.1,
        height: widget.isSmall != null
            ? null
            : widget.height ?? MediaQuery.of(context).size.height / 17.5,
        child: TextButton(
          onPressed: !clickEnable ? null : () => widget.onPress!(),
          style: ElevatedButton.styleFrom(
            backgroundColor: isPrimary || (isPrimary && !clickEnable)
                ? widget.backgroundColor ?? BaseColors.primaryColor
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: widget.borderRadius == null
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(widget.borderRadius!),
              side: BorderSide(
                  color: widget.backgroundColor ?? BaseColors.primaryColor,
                  width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.prefixIcon ?? const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    widget.title,
                    style: widget.textStyle ??
                        TextStyle(
                          color: isPrimary == true && clickEnable
                              ? BaseColors.whiteColor
                              : !clickEnable
                                  ? BaseColors.textGreenColor
                                  : widget.backgroundColor ??
                                      BaseColors.primaryColor,
                          fontSize: widget.fontSize ?? 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                widget.suffixIcon ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
