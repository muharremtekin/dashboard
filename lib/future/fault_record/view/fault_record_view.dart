import 'package:flutter/material.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';
import 'package:new_dashboard/future/fault_record/components/list_item.dart';
import 'package:new_dashboard/future/fault_record/components/aes_filter_dropdown.dart';
import 'package:new_dashboard/future/fault_record/components/aes_search_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_dashboard/future/fault_record/helper/app_helper.dart';
import 'package:new_dashboard/future/fault_record/view/add_fault_record_view.dart';
import 'package:new_dashboard/future/fault_record/viewModel/fault_record_viewmodel.dart';

class FaultRecordView extends StatefulWidget {
  const FaultRecordView({super.key});

  @override
  State<FaultRecordView> createState() => _FaultRecordViewState();
}

class _FaultRecordViewState extends State<FaultRecordView> {
  final FaultRecordViewmodel _faultRecordViewmodel = FaultRecordViewmodel();

  @override
  void initState() {
    super.initState();

    _faultRecordViewmodel.getFaultRecordList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // sol menü alanı
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                // Header alanı
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
                // fault alanı başlangıcı
                Expanded(
                  flex: 8,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          // search
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _buildSearchProduct(
                                _faultRecordViewmodel.searchController,
                              ),
                            ),
                          ),
                          // filter
                          Observer(builder: (_) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              color: Colors.grey[200],
                              width: _faultRecordViewmodel.isFilterMenuOpen
                                  ? context.width * 0.2
                                  : 0,
                              child: _buildFilterProduct(context),
                            );
                          }),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: _buildAddFaultRecordButton(context),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  IconButton _buildAddFaultRecordButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        AppHelper.instance.anyDialog(
          context,
          // helper sadece widget alsın
          // fault record kayıt ekranını ayrı widget olarak kodlayıp buraya vericem

          AddFaultRecordView(
            faultRecordViewmodel: _faultRecordViewmodel,
            context: context,
          ),
        );
      },
      icon: Icon(
        Icons.add,
        size: context.width * 0.06,
      ),
    );
  }

  Widget _buildFilterProduct(BuildContext context) {
    // menü itemler
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filtre",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          FilterDropDown(
            globalKey: _faultRecordViewmodel.globalKey1,
            title: 'Müşteri',
            items: const ['test', 'test2'],
          ),
          FilterDropDown(
            globalKey: _faultRecordViewmodel.globalKey2,
            title: 'Makine - Model',
            items: const ['test', 'test2'],
          ),
          FilterDropDown(
            globalKey: _faultRecordViewmodel.globalKey3,
            title: 'Etiket',
            items: const ['test', 'test2'],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchProduct(TextEditingController textController) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                      flex: 30,
                      child: AesSearchField(textController: textController)),
                  Expanded(
                    flex: 1,
                    child: Observer(builder: (_) {
                      return _buildShowFilterButton();
                    }),
                  )
                ],
              ),
            ),
            // Headers
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: _buildListviewHeaders(),
            ),
            // Items
            Expanded(
              flex: 5,
              child: Observer(
                builder: (_) {
                  return _buildListView();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListviewHeaders() {
    return Row(
      children: [
        Expanded(flex: 9, child: _buildOneHeader('Arıza Başlığı')),
        Expanded(flex: 9, child: _buildOneHeader('Arıza Tipi')),
        Expanded(flex: 9, child: _buildOneHeader('UT Kodu')),
        Expanded(flex: 10, child: _buildOneHeader('Firma')),
        const Expanded(flex: 10, child: Text('')),
      ],
    );
  }

  ListView _buildListView() {
    return ListView.separated(
      // shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _faultRecordViewmodel.faultRecordList.length,
      itemBuilder: (context, index) {
        final fault = _faultRecordViewmodel.faultRecordList[index];
        return ListItem(
          faultRecordModel: fault,
        );
      },
    );
  }

  Text _buildOneHeader(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  IconButton _buildShowFilterButton() {
    return IconButton(
      onPressed: () {
        _faultRecordViewmodel.changeFilterMenuState();
      },
      icon: const Icon(Icons.filter_alt_outlined),
      color:
          _faultRecordViewmodel.isFilterMenuOpen ? Colors.blue : Colors.black,
    );
  }
}
