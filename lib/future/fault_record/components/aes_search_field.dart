import 'package:flutter/material.dart';
import 'package:new_dashboard/core/extensions/context_extensions.dart';

class AesSearchField extends StatelessWidget {
  const AesSearchField({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: vm.filter.isFiltered! ? Border.all(width: 1, color: context.colors.primary) : null,
        color: context.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: TextField(
          // enabled: !vm.filter.isFiltered!,
          // controller: vm.searchController,
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            // vm.getBySearch();
          },
          decoration: InputDecoration(
            hintText: "Ara...",
            // vm.filter.isFiltered! ? "" : "Arama yap...", // TODO translate
            hintStyle: context.textTheme.titleMedium!.copyWith(fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: context.colors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.only(left: 15.0, top: 13),
            suffixIcon: FittedBox(
              child: Row(
                children: [
                  Tooltip(
                    height: 30,
                    message: "Filtreli Arama!", // TODO translate
                    child: Text(
                      "F",
                      style: TextStyle(
                        color: context.colors.onPrimary.withOpacity(0.5),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
