// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'base_color.dart';
import 'package:flutter/material.dart';

class UiKeypad extends StatefulWidget {
  final Function onPressed;
  final Function delete;
  final Function onSubmit;
  final TextEditingController? controller;
  final Widget content;
  final Color? borderRestColor;
  final Color? bgRestColor;
  final Color? borderClickColor;
  final Color? bgClickColor;
  final double? widthBorder;

  const UiKeypad({
    super.key,
    required this.onPressed,
    required this.delete,
    required this.onSubmit,
    this.controller,
    required this.content,
    this.borderRestColor,
    this.bgRestColor,
    this.borderClickColor,
    this.bgClickColor,
    this.widthBorder = 0,
  });

  @override
  State<UiKeypad> createState() => _UiKeypadState();
}

class _UiKeypadState extends State<UiKeypad> {
  Color colorText = Color(0xFF38454C);
  late Color colorBorder = widget.borderClickColor!;
  late Color colorBackground = widget.bgClickColor!;
  late int pinLength;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            KeyPadButton(context),
          ],
        ),
      ),
    );
  }

  Widget KeyPadButton(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onTapDown: (_) {
        setState(() {
          colorBorder = widget.borderClickColor ?? Colors.grey;
          colorBackground = widget.bgClickColor ?? Colors.transparent;
        });
      },
      onTapUp: (_) {
        setState(() {
          colorBorder = widget.borderRestColor ?? Colors.transparent;
          colorBackground = widget.bgRestColor ?? Colors.transparent;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: colorBackground,
          border: (widget.widthBorder! > 0)
              ? Border.all(width: widget.widthBorder!, color: colorBorder)
              : null,
        ),
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.width * 0.15,
        child: widget.content,
      ),
    );
  }
}
