// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_viewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardViewModel on _DashboardViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_DashboardViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$productionListAtom =
      Atom(name: '_DashboardViewModelBase.productionList', context: context);

  @override
  List<ProductionModel> get productionList {
    _$productionListAtom.reportRead();
    return super.productionList;
  }

  @override
  set productionList(List<ProductionModel> value) {
    _$productionListAtom.reportWrite(value, super.productionList, () {
      super.productionList = value;
    });
  }

  late final _$getAllProductionAsyncAction =
      AsyncAction('_DashboardViewModelBase.getAllProduction', context: context);

  @override
  Future<List<ProductionModel>> getAllProduction() {
    return _$getAllProductionAsyncAction.run(() => super.getAllProduction());
  }

  late final _$_DashboardViewModelBaseActionController =
      ActionController(name: '_DashboardViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_DashboardViewModelBaseActionController.startAction(
        name: '_DashboardViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_DashboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
productionList: ${productionList}
    ''';
  }
}
