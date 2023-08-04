import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';

class FilterDropDown extends StatefulWidget {
  final GlobalKey<DropdownSearchState<String>>? globalKey;
  final String? title;
  final List<String>? items;

  const FilterDropDown({
    super.key,
    required this.globalKey,
    required this.title,
    required this.items,
  });

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  List<String>? get _tempItems => widget.items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title!, // TODO translate
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: DropdownSearch<String>.multiSelection(
            key: widget.globalKey,
            // selectedItems: widget.selectedItems ?? [],
            items: (widget.items!
                .toSet()
                .where((element) =>
                    _tempItems!.toSet().contains(element.toUpperCase()))
                .toList())
              ..sort((a, b) => a.compareTo(b)),
            popupProps: PopupPropsMultiSelection.dialog(
              showSelectedItems: true,
              showSearchBox: true,
              containerBuilder: (ctx, popupWidget) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // alignment: Alignment.centerLeft,
                          padding: context.paddingLow,
                          child: Text(
                            widget.title!, // TODO translate
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: context.colors.onSurface,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => widget.globalKey!.currentState!
                              .closeDropDownSearch(),
                          icon: const Icon(Icons.clear),
                        )
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: popupWidget,
                    )),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
