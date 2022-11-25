import 'base_color.dart';
import 'package:flutter/material.dart';

///```
///example
/// appBar: UiAppBar(
//   title: Text('title'),
//   isCenterTitle: true,
//   hideBackButton: false,
//   appBarType: AppBarType.lightTheme,
//   leadingWidth: 100,
//   elevation : 2
//   titleSpacing : 1
//   leading: Row(
//     children: [
//       Icon(Icons.abc_outlined),
//       Text('leadding'),
//     ],
//   ),
//   actions: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [Icon(Icons.abc_outlined)],
//     ),
//   ],
// ),
///```
class UiAppBar extends StatelessWidget with PreferredSizeWidget {
  const UiAppBar({
    super.key,
    this.leading,
    this.leadingWidth,
    this.title,
    this.isCenterTitle,
    this.elevation,
    this.actions,
    this.hideBackButton = false,
    this.titleSpacing,
    required this.appBarType,
  });

  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final bool? isCenterTitle;
  final double? elevation;
  final List<Widget>? actions;
  final double? titleSpacing;
  final bool hideBackButton;
  final AppBarType appBarType;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: titleSpacing ?? 0,
      leading: hideBackButton ? Container() : onBackPress(context),
      leadingWidth: leadingWidth,
      title: title,
      centerTitle: isCenterTitle ?? true,
      backgroundColor: _setColor(),
      actions: actions,
      elevation: elevation ?? 0,
      toolbarTextStyle: _setTextStyle(),
      titleTextStyle: _setTextStyle(),
      iconTheme: _setIconThemData(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget onBackPress(BuildContext context) {
    if (leading != null) return leading!;

    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 20,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  IconThemeData _setIconThemData() {
    switch (appBarType) {
      case AppBarType.darkTheme:
        return const IconThemeData(color: BaseColors.whiteColor);
      case AppBarType.lightTheme:
        return const IconThemeData(color: BaseColors.blackColor);
    }
  }

  TextStyle _setTextStyle() {
    switch (appBarType) {
      case AppBarType.darkTheme:
        return const TextStyle(color: BaseColors.whiteColor);
      case AppBarType.lightTheme:
        return const TextStyle(color: BaseColors.blackColor);
    }
  }

  Color _setColor() {
    switch (appBarType) {
      case AppBarType.darkTheme:
        return BaseColors.secondaryColor;
      case AppBarType.lightTheme:
        return BaseColors.whiteColor;
    }
  }
}

enum AppBarType { darkTheme, lightTheme }
