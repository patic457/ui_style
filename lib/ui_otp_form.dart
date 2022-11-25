
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ui_style/ui_style.dart';

class UiOTPForm extends StatefulWidget {
  final int numOfOtp;
  final Function(String) callBackOtpValue;

  const UiOTPForm({
    Key? key,
    required this.numOfOtp,
    required this.callBackOtpValue,
  }) : super(key: key);

  @override
  State<UiOTPForm> createState() => _UiOTPFormState();
}

class _UiOTPFormState extends State<UiOTPForm> {
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      textStyle: const TextStyle(
        color: BaseColors.textGreenColor,
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),
      showCursor: false,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
          fillColor: BaseColors.primaryColor50,
          filled: true,
          hintText: "_"),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      autoFocus: true,
      fieldWidth: 45,
      hasCustomInputDecoration: true,
      onSubmit: (value) => widget.callBackOtpValue(value.toString()),
    );
  }
}
