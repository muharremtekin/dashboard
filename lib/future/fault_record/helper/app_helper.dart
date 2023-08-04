import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';

class AppHelper {
  static AppHelper? _instance;
  static AppHelper get instance {
    _instance ??= AppHelper._init();
    return _instance!;
  }

  AppHelper._init();

  Future<DateTime?> selectDate(BuildContext context,
      {DateTime? initialDate}) async {
    return await showDatePicker(
        context: context,
        initialDate: initialDate!,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
  }

  Timer? _debouncer;

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (_debouncer != null) {
      _debouncer!.cancel();
    }

    _debouncer = Timer(duration, callback);
  }

  Future<dynamic> anyDialog(
    BuildContext context,
    Widget widget,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              width: context.width * 0.7,
              height: context.height * 0.7,
              child: Card(
                elevation: 4,
                color: context.colors.surface,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: context.paddingLow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: widget,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: context.paddingLow,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
