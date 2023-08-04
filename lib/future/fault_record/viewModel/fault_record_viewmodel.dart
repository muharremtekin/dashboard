import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:new_dashboard/core/constants/time_constants.dart';
import 'package:new_dashboard/future/fault_record/model/fault_record_model.dart';
part 'fault_record_viewmodel.g.dart';

class FaultRecordViewmodel = _FaultRecordViewmodelBase
    with _$FaultRecordViewmodel;

abstract class _FaultRecordViewmodelBase with Store {
  final GlobalKey<DropdownSearchState<String>>? globalKey1 =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>>? globalKey2 =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>>? globalKey3 =
      GlobalKey<DropdownSearchState<String>>();

  TextEditingController searchController = TextEditingController();

  final TextEditingController technicianNameController =
      TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController utCodeTypeController = TextEditingController();

  @observable
  List<FaultRecordModel> faultRecordList = ObservableList<FaultRecordModel>();

  @observable
  bool isFilterMenuOpen = false;

  @observable
  bool isLoading = false;

  @observable
  DateTime startDate = DateTime(TimeConstants.initYear);

  @observable
  DateTime endDate = DateTime(TimeConstants.initYear);

  @action
  void changeFilterMenuState() {
    isFilterMenuOpen = !isFilterMenuOpen;
  }

  @action
  void changeLoadingState() {
    isLoading = !isLoading;
  }

  bool validate() {
    if (technicianNameController.text == '' ||
        titleController.text == '' ||
        descriptionController.text == '' ||
        customerController.text == '' ||
        startDate == DateTime(TimeConstants.initYear) ||
        endDate == DateTime(TimeConstants.initYear)) {
      return false;
    } else {
      return true;
    }
  }

  @action
  void clearTextFields() {
    technicianNameController.clear();
    titleController.clear();
    descriptionController.clear();
    customerController.clear();
    utCodeTypeController.clear();
  }

  @action
  void clearDateFields() {
    startDate = DateTime(TimeConstants.initYear);
    endDate = DateTime(TimeConstants.initYear);
  }

  @action
  Future<void> addFaultRecord() async {
    bool isValidate = validate();
    if (isValidate) {
      changeLoadingState();
      await Future.delayed(const Duration(seconds: 1));
      FaultRecordModel record = FaultRecordModel(
        technicianNameSurname: technicianNameController.text.trim(),
        startDate: startDate,
        endDate: endDate,
        customerName: customerController.text.trim(),
        utCode: utCodeTypeController.text.trim(),
        faultTitle: titleController.text.trim(),
        faultDescription: descriptionController.text.trim(),
        faultType: 'test',
      );
      faults.add(record);
      getFaultRecordList();
      clearTextFields();
      clearDateFields();
      changeLoadingState();
    }
  }

  @action
  void getFaultRecordList() {
    if (faultRecordList.isNotEmpty) {
      faultRecordList.clear();
    }
    faultRecordList = faults;
  }

  @action
  void setStartDate(DateTime dateTime) {
    startDate = dateTime;
  }

  @action
  void setEndDate(DateTime dateTime) {
    endDate = dateTime;
  }
}
