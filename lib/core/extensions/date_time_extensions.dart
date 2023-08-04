import 'package:new_dashboard/core/constants/time_constants.dart';

extension DateTimeExtension on DateTime {
  // ignore: non_constant_identifier_names
  String get DDMMYYYYhhmm => '$day/$month/$year $hour:$minute';

  bool get isInitDate => year == TimeConstants.initYear;
}
