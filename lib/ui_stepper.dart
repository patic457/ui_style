import 'base_color.dart';
import 'package:flutter/material.dart';

class UiStepper extends StatelessWidget {
  final List<StepModel> list;
  final int currentState;
  const UiStepper({
    super.key,
    required this.list,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return list.length - 1 != index
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    createBundle(index),
                    Container(
                      // color: Colors.red,
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Center(
                        child: Container(
                          width: 68.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20.0),
                                right: Radius.circular(20.0)),
                            color: index <= currentState
                                ? BaseColors.primaryColor
                                : BaseColors.greyColor,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : createBundle(index);
        },
      ),
    );
  }

  Widget createBundle(int index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(
              width: 1,
              color: index <= currentState
                  ? BaseColors.primaryColor
                  : BaseColors.greyColor,
            ),
            // color: Colors.blue,
          ),
          child: Icon(
            list[index].icon,
            color: index <= currentState
                ? BaseColors.primaryColor
                : BaseColors.greyColor,
            size: 40.0,
          ),
        ),
        Text(
          list[index].title,
          style: TextStyle(
              color: index <= currentState
                  ? BaseColors.primaryColor
                  : BaseColors.greyColor,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class StepModel {
  String title;

  IconData icon;

  StepModel(
    this.title,
    this.icon,
  );
}
