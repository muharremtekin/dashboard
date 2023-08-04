// ignore: depend_on_referenced_packages

class FaultRecordModel {
  String technicianNameSurname;
  DateTime startDate;
  DateTime endDate;
  String customerName;
  String utCode;
  String faultTitle;
  String faultDescription;
  String faultType;
  FaultRecordModel({
    required this.technicianNameSurname,
    required this.startDate,
    required this.endDate,
    required this.customerName,
    required this.utCode,
    required this.faultTitle,
    required this.faultDescription,
    required this.faultType,
  });
}

List<FaultRecordModel> faults = [
  FaultRecordModel(
    technicianNameSurname: 'technicianName',
    startDate: DateTime(2021, 10, 10, 09, 00),
    endDate: DateTime(2021, 10, 10, 17, 00),
    customerName: 'Sony Interactive Entertainment',
    utCode: 'CNC-0001',
    faultTitle: 'Motor yağ kaçağı',
    faultDescription: 'Motor yağ kaçağı tespit edildi. Kullanıcı hatası.',
    faultType: 'Mekanik',
  ),
  FaultRecordModel(
    technicianNameSurname: 'technicianName',
    startDate: DateTime(2021, 10, 10, 09, 00),
    endDate: DateTime(2021, 10, 10, 17, 00),
    customerName: 'Bethesda Softworks',
    utCode: 'CNC-0002',
    faultTitle: 'Devre kartı arızası',
    faultDescription:
        'Devre kartı arızası tespit edildi. Kart yanmış ve kullanılamaz halde. Fabrikasyon hata',
    faultType: 'Elektronik',
  ),
  FaultRecordModel(
    technicianNameSurname: 'technicianName',
    startDate: DateTime(2021, 10, 10, 09, 00),
    endDate: DateTime(2021, 10, 10, 17, 00),
    customerName: 'TaleWorlds Entertainment',
    utCode: 'CNC-0003',
    faultTitle: 'Basit kısa devre',
    faultDescription: 'Ampul anahtarı kısa devre yapmış. Kullanıcı hatası.',
    faultType: 'Elektronik',
  ),
  FaultRecordModel(
    technicianNameSurname: 'technicianName',
    startDate: DateTime(2021, 10, 10, 09, 00),
    endDate: DateTime(2021, 10, 10, 17, 00),
    customerName: 'Sony Interactive Entertainment',
    utCode: 'CNC-0004',
    faultTitle: 'Motor yağ kaçağı',
    faultDescription: 'Motor yağ kaçağı tespit edildi. Kullanıcı hatası.',
    faultType: 'Mekanik',
  ),
  FaultRecordModel(
    technicianNameSurname: 'technicianName',
    startDate: DateTime(2021, 10, 10, 09, 00),
    endDate: DateTime(2021, 10, 10, 17, 00),
    customerName: 'Sony Interactive Entertainment',
    utCode: 'CNC-0005',
    faultTitle: 'Motor yağ kaçağı',
    faultDescription: 'Motor yağ kaçağı tespit edildi. Kullanıcı hatası.',
    faultType: 'Mekanik',
  ),
];
