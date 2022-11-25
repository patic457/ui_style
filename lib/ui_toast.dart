import 'base_color.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
// import 'base_color.dart';

class UiToast extends StatefulWidget {
  final String msg;
  final Icon? iconLeading;
  final Widget? trailing;

  const UiToast({
    Key? key,
    required this.msg,
    this.iconLeading,
    this.trailing,
  }) : super(key: key);

  @override
  State<UiToast> createState() => _UiToastState();
}

class _UiToastState extends State<UiToast> {
  late FToast flutterToast;

  @override
  Widget build(BuildContext context) {
    return buildContainer(context);
  }

  Wrap buildContainer(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: BaseColors.bgToastColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(child: widget.iconLeading ?? const SizedBox()),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Text(
                      widget.msg,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        color: BaseColors.whiteColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                child: widget.trailing ?? const SizedBox(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

FToast initToast(BuildContext context) {
  late FToast flutterToast;
  flutterToast = FToast();
  return flutterToast.init(context);
}
