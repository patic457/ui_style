// ignore_for_file: constant_identifier_names


import 'package:flutter/material.dart';
import 'package:ui_style/ui_style.dart';

class CustomDialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String desc;
  final String CustomButton;
  final String cancelBtn;
  final DialogType dialogType;
  final Function(bool) function;
  const CustomDialog({
    Key? key,
    required this.context,
    required this.title,
    required this.desc,
    required this.CustomButton,
    required this.cancelBtn,
    required this.function,
    required this.dialogType,
  }) : super(key: key);

  @override
  Widget build(context) {
    late String imgPath;
    late Color themeColorDialog;

    if (dialogType == DialogType.Success) {
      imgPath = 'packages/ui_style/assets/image/icon_correct.png';
      themeColorDialog = BaseColors.successColor;
    } else if (dialogType == DialogType.Warning) {
      imgPath = 'packages/ui_style/assets/image/icon_warning.png';
      themeColorDialog = BaseColors.warningColor;
    } else if (dialogType == DialogType.Fail) {
      imgPath = 'packages/ui_style/assets/image/icon_incorrect.png';
      themeColorDialog = BaseColors.failColor;
    }

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 25),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x0f000000),
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1, 0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context, context);
                        },
                        icon: const Icon(
                          Icons.clear_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 130,),
                      child: Image.asset(
                        imgPath,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 28,
                          color: themeColorDialog,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 20),
                      child: Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 19.5,
                        child: ElevatedButton(
                          onPressed: () {
                            function(true);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: BaseColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          child: Text(CustomButton),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 19.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          side:
                              const BorderSide(color: BaseColors.primaryColor),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          cancelBtn,
                          style: const TextStyle(
                            color: BaseColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum DialogType {
  Default,
  Success,
  Warning,
  Fail,
}

// showDialog(
// context: context,
// builder: (BuildContext context1) => CustomDialog(
// context: context1,
// title: "Success!",
// desc:
// "Please look out for an email from AIS to get the notification when the product you chose becomes available.",
// submitBtn: "confirm",
// cancelBtn: "confirm",
// dialogType: DialogType.Success  or DialogType.Warning or  DialogType.Fail
// function: (isClicked) {
// if (isClicked) ddd();
// }),