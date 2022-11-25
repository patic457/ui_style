import 'base_color.dart';
import 'package:flutter/material.dart';

class UiPopUpDialog extends StatelessWidget {
  final Widget? headerTitle;
  final Widget? headerDesc;
  final Widget? content;
  final Widget? footer;

  const UiPopUpDialog({
    Key? key,
    this.content,
    this.footer,
    this.headerTitle,
    this.headerDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 32.0,
              right: 20.0,
              left: 20.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: Container(
                    child: headerTitle ?? const SizedBox(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 24.0,
                    left: 12,
                    right: 12,
                  ),
                  child: Container(
                    child: headerDesc ?? const SizedBox(),
                  ),
                ),
                Container(
                  child: content ?? const SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 20.0,
                  ),
                  child: Container(
                    child: footer ?? const SizedBox(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
