import 'package:flutter/material.dart';
import 'package:new_dashboard/core/enums/sizes_enum.dart';

import 'custom_text.dart';

class TimeToggleButtons extends StatefulWidget {
  const TimeToggleButtons({super.key});

  @override
  State<TimeToggleButtons> createState() => _TimeToggleButtonsState();
}

class _TimeToggleButtonsState extends State<TimeToggleButtons> {
  final List<bool> selectedTime = [true, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        setState(
          () {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < selectedTime.length; i++) {
              selectedTime[i] = i == index;
            }
          },
        );
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.green[700],
      selectedColor: Colors.white,
      fillColor: Colors.green[200],
      color: Colors.green[400],
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 80.0,
      ),
      isSelected: selectedTime,
      children: times,
    );
  }
}

final List<Widget> times = [
  CustomText(
    title: '6 Ay',
    fontSize: Sizes.size16.size,
  ),
  CustomText(
    title: '1 Yıl',
    fontSize: Sizes.size16.size,
  )
];
