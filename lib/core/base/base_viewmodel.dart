import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? ctx;

  void setContext(BuildContext context);
  void init();
}
