import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../routes/navigator_extenstions.dart';

class CustomSearchMenuDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String>? onSelected;

  final bool readOnly;

  final EdgeInsets? insetPadding;

  final bool enableSearch;

  const CustomSearchMenuDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.onSelected,
    this.readOnly = false,
    this.insetPadding,
    this.enableSearch = true,
  });

  @override
  State<CustomSearchMenuDropdown> createState() =>
      _CustomSearchMenuDropdownState();
}

class _CustomSearchMenuDropdownState extends State<CustomSearchMenuDropdown> {
  late String selectedValue;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  late List<String> filteredItems;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.initialValue ??
        (widget.items.isNotEmpty ? widget.items.first : '');
    filteredItems = List.from(widget.items);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showMenu(BuildContext context) async {
    if (widget.readOnly) return;

    _searchController.clear();
    filteredItems = List.from(widget.items);

    String? selected = await showDialog<String>(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              insetPadding:
                  widget.insetPadding ??
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.enableSearch)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setDialogState(() {
                                filteredItems = widget.items
                                    .where(
                                      (item) => item.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                    )
                                    .toList();
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search...",
                              prefixIcon: const Icon(Icons.search),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),

                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100,
                          maxHeight: 350,
                        ),
                        child: Scrollbar(
                          controller: _scrollController,
                          thumbVisibility: true,
                          child: ListView.separated(
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: filteredItems.length,
                            separatorBuilder: (_, __) =>
                                Divider(height: 1, color: AppColor.blackColor),
                            itemBuilder: (_, index) {
                              final item = filteredItems[index];
                              return InkWell(
                                onTap: () => context.pop(item),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                  child: Center(
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    if (selected != null) {
      setState(() => selectedValue = selected);
      widget.onSelected?.call(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMenu(context),
      child: Container(
        padding: const EdgeInsets.only(left: 3, right: 12, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: widget.readOnly
              ? AppColor.whiteColor.withOpacity(0.7)
              : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.readOnly
                ? AppColor.blackColor.withOpacity(0.3)
                : AppColor.blackColor.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: Text(
                    selectedValue,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: widget.readOnly
                          ? AppColor.blackColor.withOpacity(0.4)
                          : AppColor.blackColor,
                    ),
                  ),
                ),
              ),
            ),

            if (!widget.readOnly)
              Image.asset(
                "assets/images/first_time_login/dropdown_arrow_deactive.png",
                width: 25,
                height: 25,
              ),
          ],
        ),
      ),
    );
  }
}
