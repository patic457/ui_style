import 'package:ui_style/ui_style.dart';
import 'package:flutter/material.dart';

class UiAlertDialog extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String desc;
  final String submitBtn;
  final DialogType dialogType;
  final VoidCallback? onPressed;
  const UiAlertDialog({
    Key? key,
    required this.context,
    required this.title,
    required this.desc,
    required this.submitBtn,
    required this.onPressed,
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
      imgPath = 'packages/ui_style/assets/image/icon_error.png';
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
                    Image.asset(
                      imgPath,
                      width: 65,
                      height: 65,
                      fit: BoxFit.cover,
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
                            onPressed!();
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
                          child: Text(submitBtn),
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
