// ignore: file_names
import 'package:mobx/mobx.dart';
import 'package:new_dashboard/future/dashboard/model/production_model.dart';

import '../../fake_productions.dart';

part 'dashboard_viewModel.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

abstract class _DashboardViewModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<ProductionModel> productionList = [];

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<List<ProductionModel>> getAllProduction() async {
    changeLoading();
    await Future.delayed(const Duration(seconds: 2));
    changeLoading();
    return DummyProducts.products!;
  }
}
