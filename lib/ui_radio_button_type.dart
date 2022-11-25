// ignore_for_file: prefer_const_constructors

import 'package:ui_style/image_converter.dart';
import 'package:ui_style/ui_model/RadioTypeModel.dart';
import 'package:ui_style/ui_style.dart';
import 'override_ui/base_radio_list_tile.dart';
import 'package:flutter/material.dart';

class UiRadioButtonType1 extends StatefulWidget {
  final List<RadioType1Model>? radioType1Model;
  final Function(dynamic) onSelected;

  const UiRadioButtonType1({
    Key? key,
    required this.onSelected,
    required this.radioType1Model,
  }) : super(key: key);

  @override
  State<UiRadioButtonType1> createState() => _UiRadioButtonType1State();
}

class _UiRadioButtonType1State extends State<UiRadioButtonType1> {
  String? selectedValueType1;
  final disableTextColor = BaseColors.blackColorA40; // Color for disable
  final enableTextColor = BaseColors.darkestGrey; // Color for text enable
  final enableSubTextColor = BaseColors.greyBtnColor; // Color for text enable

  setSelectedValueType1(String val) {
    setState(() {
      selectedValueType1 = val;
      widget.onSelected(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.radioType1Model?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        var item = widget.radioType1Model![index];
        return Theme(
          data: Theme.of(context).copyWith(highlightColor: Colors.white),
          child: RadioListTile(
            value: item.value,
            groupValue: selectedValueType1,
            title: Text(
              item.title,
              style: TextStyle(
                  fontSize: 20,
                  color: item.isDisable == true
                      ? disableTextColor
                      : enableTextColor,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(item.subtitle,
                style: TextStyle(
                    fontSize: 20,
                    color: item.isDisable == true
                        ? disableTextColor
                        : enableSubTextColor,
                    fontWeight: FontWeight.w400)),
            onChanged: item.isDisable == true
                ? null
                : (data) {
                    setSelectedValueType1(data.toString());
                  },
            secondary: Text(
              item.amount,
              style: TextStyle(
                  fontSize: 24,
                  color: item.isDisable == true
                      ? disableTextColor
                      : enableTextColor,
                  fontWeight: FontWeight.w700),
            ),
            selected: selectedValueType1 == item.value,
            activeColor: BaseColors.primaryColor,
          ),
        );
      },
    );
  }
}

class UiRadioButtonType2 extends StatefulWidget {
  final List<RadioType2Model>? radioType2Model;
  final Function(dynamic) onSelected;

  const UiRadioButtonType2(
      {super.key, this.radioType2Model, required this.onSelected});

  @override
  State<UiRadioButtonType2> createState() => _UiRadioButtonType2State();
}

class _UiRadioButtonType2State extends State<UiRadioButtonType2> {
  String? selectedValueType2;
  final disableTextColor = BaseColors.blackColorA40; // Color for disable
  final enableTextColor = BaseColors.darkestGrey; // Color for text enable

  setSelectedValueType2(String val) {
    setState(() {
      selectedValueType2 = val;
      widget.onSelected(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.radioType2Model?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.radioType2Model![index];
          return Theme(
            data: Theme.of(context).copyWith(highlightColor: Colors.white),
            child: RadioListTile(
              value: item.value,
              groupValue: selectedValueType2,
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: InkWell(
                      child: ImageConverter(
                        imageUrl: item.image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        color: item.isDisable == true
                            ? disableTextColor // disable
                            : enableTextColor,
                        fontSize: 18),
                  ),
                ],
              ),
              onChanged: item.isDisable == true
                  ? null
                  : (data) {
                      setSelectedValueType2(data.toString());
                    },
              selected: selectedValueType2 == item.value,
              activeColor: BaseColors.primaryColor,
            ),
          );
        });
  }
}

class UiRadioButtonType3 extends StatefulWidget {
  final List<RadioType3Model>? radioType3Model;
  final Function(dynamic) onSelected;

  const UiRadioButtonType3({
    Key? key,
    this.radioType3Model,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<UiRadioButtonType3> createState() => _UiRadioButtonType3State();
}

class _UiRadioButtonType3State extends State<UiRadioButtonType3> {
  String? selectedValueType3;

  setSelectedValueType3(String val) {
    setState(() {
      selectedValueType3 = val;
      widget.onSelected(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.radioType3Model?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.radioType3Model![index];
          return Theme(
            data: Theme.of(context)
                .copyWith(highlightColor: BaseColors.primaryColor50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: item.isDisable == true
                            ? colorBorderInfo(RadioType.Disable)
                            : selectedValueType3 == item.value
                                ? colorBorderInfo(RadioType.Active)
                                : colorBorderInfo(RadioType.Inactive),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: item.isDisable == true
                            ? [infoBoxShadow(RadioType.Disable)]
                            : selectedValueType3 == item.value
                                ? [infoBoxShadow(RadioType.Active)]
                                : [infoBoxShadow(RadioType.Inactive)]),
                    child: BaseRadioListTile(
                      value: item.value,
                      groupValue: selectedValueType3,
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: item.isDisable == true
                              ? BaseColors.blackColorA40 // disable
                              : BaseColors.darkestGrey, // active,Inactive
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      onChanged: item.isDisable == true
                          ? null
                          : (data) {
                              // print(value);
                              setSelectedValueType3(data.toString());
                            },
                      selected: selectedValueType3 == item.value,
                      activeColor: BaseColors.primaryColor,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Border colorBorderInfo(RadioType radioType) {
    return Border.all(
        color: radioType == RadioType.Active
            ? BaseColors.primaryColor
            : radioType == RadioType.Inactive
                ? BaseColors.lightestGrey
                : radioType == RadioType.Disable
                    ? BaseColors.lightestGrey
                    : BaseColors.lightestGrey,
        style: BorderStyle.solid,
        width: 2);
  }

  BoxShadow infoBoxShadow(RadioType radioType) {
    return BoxShadow(
        color: radioType == RadioType.Active
            ? BaseColors.green50Color
            : radioType == RadioType.Inactive
                ? BaseColors.transparent
                : radioType == RadioType.Active
                    ? BaseColors.lightestGreyA40
                    : BaseColors.lightestGrey,
        spreadRadius: 3);
  }
}

class UiRadioButtonType4 extends StatefulWidget {
  final List<RadioType4Model>? radioType4Model;
  final Function(dynamic) onSelected;

  /// text for radio type 4
  final String? labelStatus;

  /// style for label status and for radio type 4
  final TextStyle? labelStatusStyle;

  const UiRadioButtonType4({
    Key? key,
    this.radioType4Model,
    required this.onSelected,
    this.labelStatus,
    this.labelStatusStyle,
  }) : super(key: key);

  @override
  State<UiRadioButtonType4> createState() => _UiRadioButtonType4State();
}

class _UiRadioButtonType4State extends State<UiRadioButtonType4> {
  String? selectedValueType4;
  final disableTextColor = BaseColors.blackColorA40; // Color for disable
  final enableTextColor = BaseColors.darkestGrey; // Color for active,Inactive

  setSelectedValueType4(String val) {
    setState(() {
      selectedValueType4 = val;
      widget.onSelected(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.radioType4Model?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.radioType4Model![index];
          return Theme(
            data: Theme.of(context)
                .copyWith(highlightColor: BaseColors.primaryColor50),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: item.isDisable == true
                            ? colorBorderInfo(RadioType.Disable)
                            : selectedValueType4 == item.value
                                ? colorBorderInfo(RadioType.Active)
                                : colorBorderInfo(RadioType.Inactive),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: item.isDisable == true
                            ? [infoBoxShadow(RadioType.Disable)]
                            : selectedValueType4 == item.value
                                ? [infoBoxShadow(RadioType.Active)]
                                : [infoBoxShadow(RadioType.Inactive)]),
                    child: RadioListTile(
                      value: item.value,
                      groupValue: selectedValueType4,
                      title: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: item.isDisable == true
                                ? disableTextColor // disable
                                : enableTextColor, // active,Inactive
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.subtitle,
                            style: TextStyle(
                              color: item.isDisable == true
                                  ? disableTextColor // disable
                                  : enableTextColor, // active,Inactive
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            item.desc,
                            style: TextStyle(
                              color: item.isDisable == true
                                  ? disableTextColor // disable
                                  : enableTextColor, // active,Inactive
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: selectedValueType4 == item.value
                                  ? mainAdressWideget()
                                  : SizedBox(
                                      height: 36,
                                    )),
                        ],
                      ),
                      onChanged: item.isDisable == true
                          ? null
                          : (data) {
                              setSelectedValueType4(data.toString());
                            },
                      selected: selectedValueType4 == item.value,
                      activeColor: BaseColors.primaryColor,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget mainAdressWideget() {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      decoration: infoBoxDecoration(),
      child: Text(
        widget.labelStatus!,
        style: TextStyle(fontSize: 18.0, color: BaseColors.primaryColor),
      ),
    );
  }

  BoxDecoration infoBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: BaseColors.greyColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      boxShadow: [BoxShadow(color: BaseColors.whiteColor)],
    );
  }

  Border colorBorderInfo(RadioType radioType) {
    return Border.all(
        color: radioType == RadioType.Active
            ? BaseColors.primaryColor
            : radioType == RadioType.Inactive
                ? BaseColors.lightestGrey
                : radioType == RadioType.Disable
                    ? BaseColors.lightestGrey
                    : BaseColors.lightestGrey,
        style: BorderStyle.solid,
        width: 2);
  }

  BoxShadow infoBoxShadow(RadioType radioType) {
    return BoxShadow(
        color: radioType == RadioType.Active
            ? BaseColors.green50Color
            : radioType == RadioType.Inactive
                ? BaseColors.transparent
                : radioType == RadioType.Active
                    ? BaseColors.lightestGreyA40
                    : BaseColors.lightestGrey,
        spreadRadius: 3);
  }
}

enum RadioType {
  Active,
  Inactive,
  Disable,
}
