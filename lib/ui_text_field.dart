import 'package:ui_style/ui_style.dart';

import 'mask_input_fomatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiTextField extends StatefulWidget {
  const UiTextField({
    super.key,
    required this.hintTextString,
    required this.textEditController,
    required this.inputType,
    this.enableBorder = true,
    this.cornerRadius,
    this.maxLength,
    this.prefixIcon,
    this.borderColor,
    this.borderColorOnFocus,
    this.textColor,
    this.textHintColor,
    this.errorMessage,
    this.labelText,
    this.themeColor,
    this.enabled = true,
    this.fillColor,
    this.function,
  });

  final hintTextString;
  final TextEditingController textEditController;
  final InputType inputType;
  final bool? enableBorder;
  final double? cornerRadius;
  final int? maxLength;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Color? borderColorOnFocus;
  final Color? textColor;
  final Color? textHintColor;
  final Color? themeColor;
  final Color? fillColor;
  final String? errorMessage;
  final String? labelText;
  final bool? enabled;
  final Function(bool)? function;

  @override
  State<UiTextField> createState() => _UiTextFieldState();
}

class _UiTextFieldState extends State<UiTextField> {
  bool isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: TextField(
        controller: widget.textEditController,
        decoration: InputDecoration(
          hintText: widget.hintTextString as String,
          errorText: isValidate ? null : validationMessage,
          counterText: '',
          border: getBorder(),
          enabledBorder: widget.enableBorder! ? getBorder() : InputBorder.none,
          focusedBorder:
              widget.enableBorder! ? getFocusBorder() : InputBorder.none,
          hintStyle: getTextHintStyle(),
          prefixIcon: widget.prefixIcon,
          suffixIcon: getSuffixIcon(),
          filled: !widget.enabled!,
          fillColor: widget.fillColor ?? BaseColors.lightestGrey,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabled: widget.enabled!,
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
        ),
        onChanged: checkValidation,
        keyboardType: getInputType(),
        obscureText: widget.inputType == InputType.Password && !visibility,
        maxLength: widget.inputType == InputType.PaymentCard
            ? 19
            : widget.maxLength ?? getMaxLength(),
        style: TextStyle(
          color: widget.textColor ?? BaseColors.blackColor,
        ),
        inputFormatters: [getFormatter()],
      ),
    );
  }

  //get border of textinput filed
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.cornerRadius ?? 4.0)),
      borderSide: BorderSide(
          width: 2, color: widget.borderColor ?? BaseColors.greyColor),
      gapPadding: 2,
    );
  }

  //get border of textinput filed
  OutlineInputBorder getFocusBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.cornerRadius ?? 4.0)),
      borderSide: BorderSide(
          width: 2,
          color: widget.borderColorOnFocus ?? BaseColors.primaryColor),
      gapPadding: 2,
    );
  }

  // formatter on basis of textinput type
  TextInputFormatter getFormatter() {
    if (widget.inputType == InputType.PaymentCard) {
      return MaskTextInputFormatter(
        mask: 'xxxx xxxx xxxx xxxx',
        separator: ' ',
      );
    } else {
      return TextInputFormatter.withFunction((oldValue, newValue) => newValue);
    }
  }

  // text style for textHint
  TextStyle getTextHintStyle() {
    return TextStyle(color: widget.textHintColor ?? BaseColors.greyColor);
  }

  // input validations
  void checkValidation(String textFieldValue) {
    if (widget.inputType == InputType.Default) {
      //default
      isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.errorMessage ?? 'Filed cannot be empty';
    } else if (widget.inputType == InputType.Email) {
      //email validation
      isValidate = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(textFieldValue);
      validationMessage = widget.errorMessage ?? 'Email is not valid';
    } else if (widget.inputType == InputType.Number) {
      //contact number validation
      isValidate = textFieldValue.length == widget.maxLength;
      validationMessage = widget.errorMessage ?? 'Contact Number is not valid';
    } else if (widget.inputType == InputType.Password) {
      //password validation
      isValidate = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(textFieldValue);
      validationMessage = widget.errorMessage ?? 'Password is not valid';
    } else if (widget.inputType == InputType.PaymentCard) {
      //payment card validation
      isValidate = textFieldValue.length == 19;
      creditCard(textFieldValue);
      validationMessage = widget.errorMessage ?? 'Card number is not correct';
    }
    oldTextSize = textFieldValue.length;
    // if (isValidate == false) {
    //   return Image.asset(
    //     'assets/image/icon_exclamation.png',
    //     width: 25,
    //     height: 25,
    //     fit: BoxFit.cover,
    //   );
    // } else if (isValidate == true) {
    //   return const Opacity(
    //     opacity: 0,
    //   );
    // }
    //change value in state
    setState(() {
      if (isValidate == false) {
        widget.function!(false);
      } else {
        widget.function!(true);
      }
    });
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.Default:
        return TextInputType.text;

      case InputType.Email:
        return TextInputType.emailAddress;

      case InputType.Number:
        return TextInputType.number;

      case InputType.PaymentCard:
        return TextInputType.number;

      default:
        return TextInputType.text;
    }
  }

  // get max length of text
  int getMaxLength() {
    switch (widget.inputType) {
      case InputType.Default:
        return 36;
      case InputType.Email:
        return 36;

      case InputType.Number:
        return 10;

      case InputType.Password:
        return 24;

      case InputType.PaymentCard:
        return 19;

      default:
        return 36;
    }
  }

  // get prefix Icon
  // Icon? getPrefixIcon() {
  //   switch (widget.inputType) {
  //     case InputType.Default:
  //       return null;
  //     case InputType.Email:
  //       return Icon(
  //         Icons.email,
  //         color: widget.themeColor ?? BaseColors.primaryColor,
  //       );

  //     case InputType.Number:
  //       return Icon(
  //         Icons.phone,
  //         color: widget.themeColor ?? BaseColors.primaryColor,
  //       );

  //     case InputType.Password:
  //       return Icon(
  //         Icons.lock,
  //         color: widget.themeColor ?? BaseColors.primaryColor,
  //       );

  //     case InputType.PaymentCard:
  //       return Icon(
  //         Icons.credit_card,
  //         color: widget.themeColor ?? BaseColors.primaryColor,
  //       );

  //     default:
  //       return Icon(
  //         Icons.person,
  //         color: widget.themeColor ?? BaseColors.primaryColor,
  //       );
  //   }
  // }

  // get suffix icon
  Widget getSuffixIcon() {
    if (widget.inputType == InputType.Password) {
      return Container(
        width: 80,
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            getWarningIcon()!,
            IconButton(
              onPressed: () {
                visibility = !visibility;
                setState(() {});
              },
              icon: Icon(
                visibility ? Icons.visibility : Icons.visibility_off,
                color: widget.themeColor ?? BaseColors.greyBtnColor,
              ),
            ),
          ],
        ),
      );
    } else {
      return const Opacity(opacity: 0, child: Icon(Icons.phone));
    }
  }

  Widget? getWarningIcon() {
    if (isValidate == false) {
      return Image.asset(
        'packages/ui_style/assets/image/icon_exclamation.png',
        width: 25,
        height: 25,
        fit: BoxFit.cover,
      );
    } else if (isValidate == true) {
      return const Opacity(
        opacity: 0,
      );
    }
  }
}

enum InputType { Default, Email, Number, Password, PaymentCard }

String creditCard(String value) {
  var x = value.replaceAll(' ', '');
  if (RegExp(r"^4[0-9]{0,15}$").hasMatch(x)) {
// visa card
// return null;
    print("visa card");
    return "visa card";
  } else if (RegExp(r"^5(?:[1-5][0-9]{0,14})?$").hasMatch(x)) {
// master card
// return null;
    print("master card");

    return "master card";
  } else if (RegExp(r"^3(?:[47][0-9]{0,13})?$").hasMatch(x)) {
// AExpress card
// return null;
    print("AExpress card");

    return "AExpress card";
  } else if (RegExp(r"^3(?:(?:0[0-5]?|[68][0-9]?)[0-9]{0,11})?$").hasMatch(x)) {
// diner card
// return null;
    print("diner card");

    return "diner card";
  } else if (RegExp(r"^6(?:(?:01{0,2}|5[0-9]{0,2})[0-9]{0,12})?$")
      .hasMatch(x)) {
// discover card
// return null;
    print("discover card");

    return "discover card";
  } else if (RegExp(
          r"^(?:2(?:1(?:31?)?)?|1(?:80{0,2})?|3(?:5\d{0,3})?)\d{0,11}$")
      .hasMatch(x)) {
// JCB card
// return null;
    print("JCB card");

    return "JCB card";
  } else {
    return "errorMessage";
  }
  ;
}
