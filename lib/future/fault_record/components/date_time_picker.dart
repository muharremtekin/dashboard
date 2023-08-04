import 'package:flutter/material.dart';

mixin DateTimePickerMixin {
  Future<DateTime?> showDateTimePickerDialog(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime(2025, 12, 31),
      helpText: 'Tarih Seçiniz',
      fieldHintText: 'Gün/Ay/Yıl',
      fieldLabelText: 'Tarih',
      cancelText: 'İptal',
      confirmText: 'Seç',
      errorFormatText: 'Hatalı tarih formatı',
      errorInvalidText: 'Geçersiz tarih',
    );

    if (pickedDate != null) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedTime = await pickTimeOfDay(context);

      if (pickedTime != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }
    return null;
  }

  Future<TimeOfDay?> pickTimeOfDay(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      initialEntryMode: TimePickerEntryMode.dial,
    );
    return pickedTime;
  }
}
