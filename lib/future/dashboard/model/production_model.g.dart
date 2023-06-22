// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionModel _$ProductionModelFromJson(Map<String, dynamic> json) =>
    ProductionModel(
      productionId: json['productionId'] as int?,
      state: json['state'] as int?,
      revisionNo: json['revisionNo'] as int?,
      utCode: json['utCode'] as String?,
      productCode: json['productCode'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      vendor: json['vendor'] as String?,
      customer: json['customer'] as String?,
      endUser: json['endUser'] as String?,
      shipPointCity: json['shipPointCity'] as String?,
      shipPointCounty: json['shipPointCounty'] as String?,
      shipPointAddress: json['shipPointAddress'] as String?,
      shipType: json['shipType'] as String?,
      orderNumber: json['orderNumber'] as int?,
      productionState: json['productionState'] as int?,
      orderDate: json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      requiredDate: json['requiredDate'] == null
          ? null
          : DateTime.parse(json['requiredDate'] as String),
      projectedDate: json['projectedDate'] == null
          ? null
          : DateTime.parse(json['projectedDate'] as String),
      lastConfirmDate: json['lastConfirmDate'] == null
          ? null
          : DateTime.parse(json['lastConfirmDate'] as String),
      revisionDate: json['revisionDate'] == null
          ? null
          : DateTime.parse(json['revisionDate'] as String),
      assemblyLocation: json['assemblyLocation'] as String?,
      serialNumber: json['serialNumber'] as String?,
    );

Map<String, dynamic> _$ProductionModelToJson(ProductionModel instance) =>
    <String, dynamic>{
      'productionId': instance.productionId,
      'state': instance.state,
      'revisionNo': instance.revisionNo,
      'utCode': instance.utCode,
      'productCode': instance.productCode,
      'brand': instance.brand,
      'model': instance.model,
      'vendor': instance.vendor,
      'customer': instance.customer,
      'endUser': instance.endUser,
      'shipPointCity': instance.shipPointCity,
      'shipPointCounty': instance.shipPointCounty,
      'shipPointAddress': instance.shipPointAddress,
      'shipType': instance.shipType,
      'orderNumber': instance.orderNumber,
      'productionState': instance.productionState,
      'orderDate': instance.orderDate?.toIso8601String(),
      'requiredDate': instance.requiredDate?.toIso8601String(),
      'projectedDate': instance.projectedDate?.toIso8601String(),
      'lastConfirmDate': instance.lastConfirmDate?.toIso8601String(),
      'revisionDate': instance.revisionDate?.toIso8601String(),
      'assemblyLocation': instance.assemblyLocation,
      'serialNumber': instance.serialNumber,
    };
