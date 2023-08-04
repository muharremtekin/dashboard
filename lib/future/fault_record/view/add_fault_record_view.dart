import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';
import 'package:new_dashboard/core/extensions/date_time_extensions.dart';
import 'package:new_dashboard/future/fault_record/components/custom_text_input.dart';
import 'package:new_dashboard/future/fault_record/components/date_time_picker.dart';
import 'package:new_dashboard/future/fault_record/viewModel/fault_record_viewmodel.dart';

class AddFaultRecordView extends StatelessWidget with DateTimePickerMixin {
  final FaultRecordViewmodel faultRecordViewmodel;
  final BuildContext context;
  AddFaultRecordView({
    super.key,
    required this.faultRecordViewmodel,
    required this.context,
  });

  @override
  Widget build(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.width * 0.32,
                child: CustomTextInput(
                    label: 'Teknisyen adı-soyadı',
                    textController:
                        faultRecordViewmodel.technicianNameController),
              ),
              SizedBox(
                width: context.width * 0.32,
                child: CustomTextInput(
                    textController: faultRecordViewmodel.customerController,
                    label: 'Firma adı'),
              )
            ],
          ),
        ),
        Observer(builder: (_) {
          return Row(
            children: [
              _selectStartDate(context),
              _selectEndDate(context),
            ],
          );
        }),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: CustomTextInput(
              textController: faultRecordViewmodel.titleController,
              label: 'Başlık'),
        ),
        CustomTextInput(
            textController: faultRecordViewmodel.descriptionController,
            label: 'Açıklama',
            maxLines: 7),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Observer(builder: (_) {
            return ElevatedButton(
              onPressed: () async {
                await faultRecordViewmodel.addFaultRecord();
              },
              child: faultRecordViewmodel.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Kaydet'),
            );
          }),
        )
      ],
    );
  }

  Widget _selectStartDate(BuildContext context) {
    return Row(
      children: [
        // Başlangıç tarihi seçimi
        // TODO: Temize çekilebilir!
        IconButton(
          onPressed: () async {
            DateTime? selectedDate = await showDateTimePickerDialog(context);
            if (selectedDate != null) {
              faultRecordViewmodel.setStartDate(selectedDate);
            }
          },
          icon: const Icon(
            Icons.calendar_today_outlined,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          faultRecordViewmodel.startDate.isInitDate
              ? 'Başlangıç tarihi ve saatini seçiniz'
              : faultRecordViewmodel.startDate.DDMMYYYYhhmm,
        ),
      ],
    );
  }

  Widget _selectEndDate(BuildContext context) {
    return Row(
      children: [
        // Başlangıç tarihi seçimi
        // TODO: Temize çekilebilir!

        ElevatedButton.icon(
          onPressed: () async {
            DateTime? selectedDate = await showDateTimePickerDialog(context);
            if (selectedDate != null) {
              faultRecordViewmodel.setEndDate(selectedDate);
            }
          },
          label: Text(
            faultRecordViewmodel.endDate.isInitDate
                ? 'Bitiş tarihi ve saatini seçiniz'
                : 'Bitiş tarihi: ${faultRecordViewmodel.endDate.DDMMYYYYhhmm}',
          ),
          icon: const Icon(Icons.calendar_today_outlined),
        ),
      ],
    );
  }
}
