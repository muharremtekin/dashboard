import 'package:flutter/material.dart';
import 'package:new_dashboard/future/fault_record/model/fault_record_model.dart';

class ListItem extends StatelessWidget {
  final FaultRecordModel faultRecordModel;
  const ListItem({
    super.key,
    required this.faultRecordModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Row(
          children: [
            Expanded(child: Text(faultRecordModel.faultTitle)),
            Expanded(child: Text(faultRecordModel.faultType)),
            Expanded(child: Text(faultRecordModel.utCode)),
            Expanded(child: Text(faultRecordModel.customerName)),
            const Expanded(child: Text('')),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
