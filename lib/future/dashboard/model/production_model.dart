// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'production_model.g.dart';

@JsonSerializable()
class ProductionModel {
  final int? productionId;
  final int? state;
  final int? revisionNo;
  final String? utCode;
  final String? productCode;
  final String? brand;
  final String? model;
  final String? vendor;
  final String? customer;
  final String? endUser;
  final String? shipPointCity;
  final String? shipPointCounty;
  final String? shipPointAddress;
  final String? shipType;
  final int? orderNumber;
  final int? productionState;
  final DateTime? orderDate;
  final DateTime? requiredDate;
  final DateTime? projectedDate;
  final DateTime? lastConfirmDate;
  final DateTime? revisionDate;
  final String? assemblyLocation;
  final String? serialNumber;
  ProductionModel({
    required this.productionId,
    required this.state,
    required this.revisionNo,
    required this.utCode,
    required this.productCode,
    required this.brand,
    required this.model,
    required this.vendor,
    required this.customer,
    required this.endUser,
    required this.shipPointCity,
    required this.shipPointCounty,
    required this.shipPointAddress,
    required this.shipType,
    required this.orderNumber,
    required this.productionState,
    required this.orderDate,
    required this.requiredDate,
    required this.projectedDate,
    required this.lastConfirmDate,
    required this.revisionDate,
    required this.assemblyLocation,
    required this.serialNumber,
  });
}

// @JsonSerializable()
// class ProductionModel extends _ProductionModel
//     with _$ProductionModel
//     implements BaseModel<ProductionModel> {
//   ProductionModel();

//   factory ProductionModel.fromJson(Map<String, dynamic> json) =>
//       _$ProductionModelFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$ProductionModelToJson(this);

//   @override
//   ProductionModel fromJson(Map<String, dynamic> json) =>
//       ProductionModel.fromJson(json);
// }

// abstract class _ProductionModel with Store {
//   @observable
//   int? productionId;
//   @observable
//   int? state;
//   @observable
//   int? revisionNo;
//   @observable
//   String? utCode = '';
//   @observable
//   String? productCode;
//   @observable
//   String? brand;
//   @observable
//   String? model;
//   @observable
//   String? vendor;
//   @observable
//   String? customer;
//   @observable
//   String? endUser;
//   @observable
//   String? shipPointCity;
//   @observable
//   String? shipPointCounty;
//   @observable
//   String? shipPointAddress;
//   @observable
//   String? shipType;
//   @observable
//   int? orderNumber;
//   @observable
//   int? productionState;
//   @observable
//   DateTime? orderDate;
//   @observable
//   DateTime? requiredDate;
//   @observable
//   DateTime? projectedDate;
//   @observable
//   DateTime? lastConfirmDate;
//   @observable
//   DateTime? revisionDate;
//   @observable
//   String? assemblyLocation;
//   @observable
//   String? serialNumber;
// }
