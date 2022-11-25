import 'base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiTextFormField extends StatefulWidget {
  const UiTextFormField({
    Key? key,
    required this.textEditController,
    required this.keyboardType,
    // this.TextEditingController,
    // this.nextTextEditingController,
    this.validator,
    this.autoValidateMode,
    this.onChanged,
    this.textStyle,
    this.hintTextStr,
    this.hintTextStyle,
    this.helperText,
    this.helperTextStyle,
    this.inputDecoration,
    this.cursorColor,
    this.border,
    this.focusedBorder,
    this.enabled,
    this.filled,
    this.obscureText,
    this.fillColor,
    this.inputFormatters,
  }) : super(key: key);

  // final InputType inputType;
  final TextInputType keyboardType;
  final TextEditingController textEditController;
  // final TextEditingController? TextEditingController;
  // final TextEditingController? nextTextEditingController;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final ValueChanged<String>? onChanged;
  final TextStyle? textStyle;
  final String? hintTextStr;
  final TextStyle? hintTextStyle;
  final String? helperText;
  final TextStyle? helperTextStyle;
  final InputDecoration? inputDecoration;
  final Color? cursorColor;
  final OutlineInputBorder? border;
  final OutlineInputBorder? focusedBorder;
  final bool? enabled;
  final bool? filled;
  final bool? obscureText;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<UiTextFormField> createState() => _UiTextFormFieldState();
}

class _UiTextFormFieldState extends State<UiTextFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return customTextFormField();
  }

  Widget customTextFormField() {
    return TextFormField(
      controller: widget.textEditController,
      keyboardType: widget.keyboardType,
      // TextEditingController: widget.TextEditingController,
      // onFieldSubmitted: (_) => widget.nextTextEditingController,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
      onChanged: widget.onChanged,
      cursorColor: widget.cursorColor ?? BaseColors.primaryColor,
      style: widget.textStyle ?? getTextValueStyle(),
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.obscureText == false || widget.obscureText == null
          ? TextInputAction.next
          : null,
      obscureText: widget.obscureText == true ? _obscurePassword : false,
      decoration: widget.inputDecoration ??
          (widget.obscureText != null && widget.obscureText == true
              ? InputDecoration(
                  hintText: widget.hintTextStr ?? "",
                  hintStyle: widget.hintTextStyle ?? getTextHintStyle(),
                  helperText: widget.helperText,
                  helperStyle: widget.helperTextStyle ?? getHelperTextStyle(),
                  enabled: widget.enabled ?? true,
                  filled: widget.filled,
                  fillColor: widget.fillColor ?? BaseColors.lightestGrey,
                  border: widget.border ?? getBorder(),
                  focusedBorder: widget.focusedBorder ?? getFocusBorder(),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: BaseColors.greyColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                )
              : getInputDecoration()),
    );
  }

  InputDecoration getInputDecoration() {
    return InputDecoration(
      hintText: widget.hintTextStr ?? "",
      hintStyle: widget.hintTextStyle ?? getTextHintStyle(),
      helperText: widget.helperText,
      helperStyle: widget.helperTextStyle ?? getHelperTextStyle(),
      enabled: widget.enabled ?? true,
      filled: widget.filled,
      fillColor: widget.fillColor ?? BaseColors.lightestGrey,
      border: widget.border ?? getBorder(),
      focusedBorder: widget.focusedBorder ?? getFocusBorder(),
      contentPadding: const EdgeInsets.all(8),
    );
  }

  // text style for textValue
  TextStyle getTextValueStyle() {
    return const TextStyle(color: BaseColors.blackColor);
  }

  // text style for textHint
  TextStyle getTextHintStyle() {
    return const TextStyle(color: BaseColors.greyColor);
  }

  // text style for helperText
  TextStyle getHelperTextStyle() {
    return const TextStyle(color: BaseColors.greyColor);
  }

  //get border of textInput filed
  OutlineInputBorder getBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      borderSide: BorderSide(width: 2, color: BaseColors.greyColor),
      gapPadding: 2,
    );
  }

  //get border of textInput filed
  OutlineInputBorder getFocusBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      borderSide: BorderSide(width: 2, color: BaseColors.primaryColor),
      gapPadding: 2,
    );
  }
}

class Validators {
  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value!.isEmpty) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> min(double min, String errorMessage) {
    return (value) {
      if (value!.trim().isEmpty) {
        return null;
      } else {
        final dValue = _toDouble(value);
        if (dValue < min) {
          return errorMessage;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> max(double max, String errorMessage) {
    return (value) {
      if (value!.trim().isEmpty) {
        return null;
      } else {
        final dValue = _toDouble(value);
        if (dValue > max) {
          return errorMessage;
        } else {
          return null;
        }
      }
    };
  }

  static FormFieldValidator<String> email(String errorMessage) {
    return (value) {
      if (value!.isEmpty) {
        return null;
      } else {
        final emailRegex = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if (emailRegex.hasMatch(value)) {
          return null;
        } else {
          return errorMessage;
        }
      }
    };
  }

  static FormFieldValidator<String> creditCard(String errorMessage) {
    return (value) {
      if (value!.isEmpty) {
        return null;
      } else {
        var x = value.replaceAll(' ', '');
        if (RegExp(r"^4[0-9]{0,15}$").hasMatch(x)) {
          // visa card
          // return "visa card";
          return null;
        } else if (RegExp(r"^5(?:[1-5][0-9]{0,14})?$").hasMatch(x)) {
          // master card
          // return "master card";
          return null;
        } else if (RegExp(r"^3(?:[47][0-9]{0,13})?$").hasMatch(x)) {
          // AExpress card
          // return "AExpress card";
          return null;
        } else if (RegExp(r"^3(?:(?:0[0-5]?|[68][0-9]?)[0-9]{0,11})?$")
            .hasMatch(x)) {
          // diner card
          // return "diner card";
          return null;
        } else if (RegExp(r"^6(?:(?:01{0,2}|5[0-9]{0,2})[0-9]{0,12})?$")
            .hasMatch(x)) {
          // discover card
          // return "discover card";
          return null;
        } else if (RegExp(
                r"^(?:2(?:1(?:31?)?)?|1(?:80{0,2})?|3(?:5\d{0,3})?)\d{0,11}$")
            .hasMatch(x)) {
          // JCB card
          // return "JCB card";
          return null;
        } else {
          return errorMessage;
        }
      }
    };
  }

  static FormFieldValidator<String> minLength(
      int minLength, String errorMessage) {
    return (value) {
      if (value!.isEmpty) return null;

      if (value.length < minLength) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> maxLength(
      int maxLength, String errorMessage) {
    return (value) {
      if (value!.isEmpty) return null;

      if (value.length > maxLength) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> patternString(
      String pattern, String errorMessage) {
    return patternRegExp(RegExp(pattern), errorMessage);
  }

  static FormFieldValidator<String> patternRegExp(
      RegExp pattern, String errorMessage) {
    return (value) {
      if (value!.isEmpty) return null;

      if (pattern.hasMatch(value)) {
        return null;
      } else {
        return errorMessage;
      }
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  // -------------------- private functions ---------------------- //

  static double _toDouble(String value) {
    value = value.replaceAll(' ', '').replaceAll(',', '');
    return double.parse(value);
  }
}
