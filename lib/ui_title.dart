// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class UiTitleBar {
  Widget titleNormal({required String title}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget titleFunction({
    required String title,
    VoidCallback? onPressed,
    String? nameButton,
  }) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          (onPressed != null && nameButton != null)
              ? InkWell(
                  onTap: onPressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        nameButton,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.green, size: 18)
                    ],
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }

  Widget titleIcons({
    required String title,
    IconButton? icon1,
    IconButton? icon2,
  }) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              icon1 ?? Text(""),
              icon2 ?? Text(""),
            ],
          )
        ],
      ),
    );
  }

  Widget titleHistory({
    required String title,
    required String name,
    required Icon icon1,
    required VoidCallback onPressed,
  }) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                icon1
              ],
            ),
          )
        ],
      ),
    );
  }
}

//
class UiTimerWithButton extends StatefulWidget {
  final Duration countDownTime;
  final String title;
  final String? nameButton;

  const UiTimerWithButton({
    super.key,
    required this.countDownTime,
    required this.title,
    this.nameButton,
  });

  @override
  State<UiTimerWithButton> createState() => _UiTimerWithButtonState();
}

class _UiTimerWithButtonState extends State<UiTimerWithButton> {
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    duration = widget.countDownTime;
    log(duration.toString());

    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(
        () {
          final seconds = duration.inSeconds - 1;
          if (seconds < 0) {
            timer?.cancel();
          } else {
            duration = Duration(seconds: seconds);
          }
        },
      ),
    );
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours),
      const Text(
        ' : ',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      buildTimeCard(time: minutes),
      const Text(
        ' : ',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      buildTimeCard(time: seconds),
    ]);
  }

  buildTimeCard({String? time = '00'}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFDE4B39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time!,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.title != null)
              ? Text(
                  widget.title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              : Text(""),
          buildTime(),
          (widget.nameButton != null)
              ? InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.nameButton!,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.green, size: 18)
                    ],
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}

class UiTimerWithIcon extends StatefulWidget {
  final Duration countDownTime;
  final String title;
  final IconButton? iconButton;

  const UiTimerWithIcon({
    super.key,
    required this.countDownTime,
    required this.title,
    this.iconButton,
  });

  @override
  State<UiTimerWithIcon> createState() => _UiTimerWithIconState();
}

class _UiTimerWithIconState extends State<UiTimerWithIcon> {
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    duration = widget.countDownTime;
    log(duration.toString());

    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(
        () {
          final seconds = duration.inSeconds - 1;
          if (seconds < 0) {
            timer?.cancel();
          } else {
            duration = Duration(seconds: seconds);
          }
        },
      ),
    );
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours),
      const Text(
        ' : ',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      buildTimeCard(time: minutes),
      const Text(
        ' : ',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      buildTimeCard(time: seconds),
    ]);
  }

  buildTimeCard({String? time = '00'}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFDE4B39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time!,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.title != null)
              ? Text(
                  widget.title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              : Text(""),
          buildTime(),
          (widget.iconButton != null) ? widget.iconButton! : Text('')
        ],
      ),
    );
  }
}
