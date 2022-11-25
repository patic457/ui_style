// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'base_color.dart';
import 'ui_model/CheckboxModel.dart';
import 'package:flutter/material.dart';

class UiCheckbox extends StatefulWidget {
  const UiCheckbox({
    super.key,
    required this.checkboxModel,
    required this.onSelected,
  });

  final List<CheckboxModel> checkboxModel;
  final Function(dynamic) onSelected;

  @override
  State<UiCheckbox> createState() => _UiCheckboxState();
}

class _UiCheckboxState extends State<UiCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(child: createListCheckbox());
  }

  ListView createListCheckbox() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.checkboxModel.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
              child: Column(
            children: <Widget>[
              new
              // CheckboxListTile(
              //   activeColor: Colors.pink[300],
              //   dense: true,
              //   //font change
              //   value: widget.checkboxModel[index].isChecked,
              //   title: new Text(
              //     widget.checkboxModel[index].title,
              //     style: TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w600,
              //         letterSpacing: 0.5),
              //   ),

              //   // secondary: Container(
              //   //   height: 50,
              //   //   width: 50,
              //   //   child: Image.asset(
              //   //     widget.checkboxModel[index].img,
              //   //     fit: BoxFit.cover,
              //   //   ),
              //   // ),
              //   onChanged: (val) {
              //     itemChange(val!, index);
              //   },
              // )

              CheckboxListTile(
                activeColor: BaseColors.primaryColor,
                title: new Text(
                  widget.checkboxModel[index].title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                ),
                value: widget.checkboxModel[index].isChecked,
                onChanged: widget.checkboxModel[index].isDisable == true
                    ? null
                    : (val) {
                        itemChange(val!, index);
                      },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ));
        });
  }

  void itemChange(bool val, int index) {
    setState(() {
      widget.checkboxModel[index].isChecked = val;
      widget.onSelected(widget.checkboxModel);
    });
  }
}
