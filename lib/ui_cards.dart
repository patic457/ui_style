// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'base_color.dart';
import 'package:flutter/material.dart';

class UiCards extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTileStyle;
  final String? subTitle2;
  final TextStyle? subTitleStyle2;
  final String btnText;
  final TextStyle? btnStyle;
  final Function(bool)? functionBtn;
  // final String? btnText2;
  // final TextStyle? btnStyle2;
  final String? labelStatus;
  final TextStyle? labelStatusStyle;
  final Function(bool)? functionLabel;
  final String cardType;

  const UiCards({
    super.key,
    required this.title,
    this.titleStyle,
    this.subTitle,
    this.subTileStyle,
    this.subTitle2,
    this.subTitleStyle2,
    required this.btnText,
    this.btnStyle,
    this.functionBtn,
    this.labelStatus,
    this.labelStatusStyle,
    this.functionLabel,
    required this.cardType,
  });

  @override
  State<UiCards> createState() => _UiCardsState();
}

class _UiCardsState extends State<UiCards> {
  @override
  Widget build(BuildContext context) {
    if (widget.cardType == "1") {
      return Card1(context);
    } else if (widget.cardType == "2") {
      return Card2(context);
    } else if (widget.cardType == "3") {
      return Card3(context);
    }
    return Card3(context);
  }

  Widget Card1(BuildContext context) {
    return Card(
      color: BaseColors.lightestGrey,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: BaseColors.darkestGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: Text(
                      widget.btnText,
                      style: widget.btnStyle ??
                          TextStyle(
                            color: BaseColors.primaryColor,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onPressed: () {
                      widget.functionBtn!(true);
                    },
                  ),
                ],
              ),
              Text(
                widget.subTitle ?? '',
                style: widget.subTileStyle ??
                    TextStyle(fontSize: 20, color: BaseColors.darkestGrey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Card2(BuildContext context) {
    return Card(
      child: Container(
        color: BaseColors.lightestGrey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: BaseColors.darkestGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: Text(
                      widget.btnText,
                      style: TextStyle(
                        color: BaseColors.primaryColor,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Card3(BuildContext context) {
    return Card(
      color: BaseColors.lightestGrey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: widget.titleStyle ??
                        TextStyle(
                            color: BaseColors.darkestGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                  ),
                  widget.btnText != ''
                      ? TextButton(
                          child: Text(
                            widget.btnText,
                            style: TextStyle(
                              color: BaseColors.primaryColor,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      : SizedBox(),
                ],
              ),
              widget.subTitle != null
                  ? Text(
                      widget.subTitle!,
                      style: widget.subTileStyle ??
                          TextStyle(
                              color: BaseColors.darkestGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    )
                  : SizedBox(),
              widget.subTitle2 != null
                  ? Text(
                      widget.subTitle2 ?? '',
                      style: widget.subTitleStyle2 ??
                          TextStyle(
                            color: BaseColors.darkestGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                      textAlign: TextAlign.start,
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.labelStatus != null
                      ?
                      // ElevatedButton(
                      //     onPressed: () {
                      //       widget.functionBtn2!(true);
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: BaseColors.whiteColor,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //     ),
                      //     child: Text(
                      //       widget.btnText2 ?? '',
                      //       style: widget.btnStyle2 ??
                      //           TextStyle(
                      //               color: BaseColors.primaryColor,
                      //               fontSize: 18),
                      //     ),
                      //   )
                      mainAdressWideget()
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
}

// Widget Card4() {
//   return Card(
//     child: Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
//       child: Container(
//         child: Column(
//           children: [
//             Icon(Icons.image),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: BaseColors.whiteColor,
//                     border: Border.all(
//                       width: 1,
//                       color: BaseColors.primaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       children: [
//                         Text(
//                           'Gallery',
//                           style: TextStyle(
//                               color: BaseColors.primaryColor,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Icon(
//                             Icons.image,
//                             size: 24.0,
//                             color: BaseColors.primaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: BaseColors.whiteColor,
//                     border: Border.all(
//                       width: 1,
//                       color: BaseColors.primaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       children: [
//                         Text(
//                           'Camera',
//                           style: TextStyle(
//                               color: BaseColors.primaryColor,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Icon(
//                             Icons.camera_alt,
//                             size: 24.0,
//                             color: BaseColors.primaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
