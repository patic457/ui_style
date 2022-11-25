import 'base_color.dart';
import 'package:flutter/material.dart';

class UiPopupMenuButton extends StatelessWidget {
  const UiPopupMenuButton(
      {Key? key,
      required this.onSelected,
      required this.menu,
      this.icon,
      this.color,
      this.shape})
      : super(key: key);

  final List<PopupMenuItem<dynamic>> menu;
  final Function(dynamic) onSelected;
  final Icon? icon;
  final Color? color;
  final RoundedRectangleBorder? shape;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon ?? Icon(Icons.adaptive.more, color: BaseColors.greyColor),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return menu;
      },
      onSelected: (dynamic value) {
        onSelected(value);
      },
    );
  }
}
