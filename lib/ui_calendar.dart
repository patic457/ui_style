import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'base_color.dart';
import 'package:flutter/material.dart';

// final today = DateUtils.dateOnly(DateTime.now());

class UiCalendar extends StatefulWidget {
  final Function(String) callBackCalendarValue;

  const UiCalendar({Key? key, required this.callBackCalendarValue})
      : super(key: key);

  @override
  State<UiCalendar> createState() => _UiCalendarState();
}

class _UiCalendarState extends State<UiCalendar> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildDefaultSingleDatePickerWithValue());
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }
    widget.callBackCalendarValue(valueText);
    return valueText;
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: BaseColors.primaryColor,
      controlsHeight: 40,
      weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
      weekdayLabelTextStyle: const TextStyle(
          color: BaseColors.greyTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 22),
      disabledDayTextStyle: const TextStyle(
        color: BaseColors.greyTextColor,
        fontSize: 24,
      ),
      controlsTextStyle: const TextStyle(
        color: BaseColors.green900Color,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(color: Colors.black, fontSize: 22),
      selectedDayTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 27,
      ),
      yearTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CalendarDatePicker2(
          config: config,
          initialValue: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (values) {
            setState(
              () => {
                _singleDatePickerValueWithDefaultValue = values,
              },
            );
          },
          selectableDayPredicate: (day) => !day
              .difference(DateTime.now().subtract(const Duration(days: 3)))
              .isNegative,
        ),
        // const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Selection(s):  '),
            // const SizedBox(width: 10),
            Text(
              _getValueText(
                config.calendarType,
                _singleDatePickerValueWithDefaultValue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
