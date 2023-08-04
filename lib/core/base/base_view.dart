import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewmodel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.viewmodel,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T viewmodel;
  @override
  void initState() {
    viewmodel = widget.viewmodel;
    widget.onModelReady(viewmodel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, viewmodel);
  }
}
