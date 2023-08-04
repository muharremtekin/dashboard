// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_record_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FaultRecordViewmodel on _FaultRecordViewmodelBase, Store {
  late final _$faultRecordListAtom =
      Atom(name: '_FaultRecordViewmodelBase.faultRecordList', context: context);

  @override
  List<FaultRecordModel> get faultRecordList {
    _$faultRecordListAtom.reportRead();
    return super.faultRecordList;
  }

  @override
  set faultRecordList(List<FaultRecordModel> value) {
    _$faultRecordListAtom.reportWrite(value, super.faultRecordList, () {
      super.faultRecordList = value;
    });
  }

  late final _$isFilterMenuOpenAtom = Atom(
      name: '_FaultRecordViewmodelBase.isFilterMenuOpen', context: context);

  @override
  bool get isFilterMenuOpen {
    _$isFilterMenuOpenAtom.reportRead();
    return super.isFilterMenuOpen;
  }

  @override
  set isFilterMenuOpen(bool value) {
    _$isFilterMenuOpenAtom.reportWrite(value, super.isFilterMenuOpen, () {
      super.isFilterMenuOpen = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FaultRecordViewmodelBase.isLoading', context: context);

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

  late final _$startDateAtom =
      Atom(name: '_FaultRecordViewmodelBase.startDate', context: context);

  @override
  DateTime get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(DateTime value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_FaultRecordViewmodelBase.endDate', context: context);

  @override
  DateTime get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$addFaultRecordAsyncAction =
      AsyncAction('_FaultRecordViewmodelBase.addFaultRecord', context: context);

  @override
  Future<void> addFaultRecord() {
    return _$addFaultRecordAsyncAction.run(() => super.addFaultRecord());
  }

  late final _$_FaultRecordViewmodelBaseActionController =
      ActionController(name: '_FaultRecordViewmodelBase', context: context);

  @override
  void changeFilterMenuState() {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.changeFilterMenuState');
    try {
      return super.changeFilterMenuState();
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingState() {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.changeLoadingState');
    try {
      return super.changeLoadingState();
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTextFields() {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.clearTextFields');
    try {
      return super.clearTextFields();
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearDateFields() {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.clearDateFields');
    try {
      return super.clearDateFields();
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getFaultRecordList() {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.getFaultRecordList');
    try {
      return super.getFaultRecordList();
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartDate(DateTime dateTime) {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.setStartDate');
    try {
      return super.setStartDate(dateTime);
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndDate(DateTime dateTime) {
    final _$actionInfo = _$_FaultRecordViewmodelBaseActionController
        .startAction(name: '_FaultRecordViewmodelBase.setEndDate');
    try {
      return super.setEndDate(dateTime);
    } finally {
      _$_FaultRecordViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faultRecordList: ${faultRecordList},
isFilterMenuOpen: ${isFilterMenuOpen},
isLoading: ${isLoading},
startDate: ${startDate},
endDate: ${endDate}
    ''';
  }
}
