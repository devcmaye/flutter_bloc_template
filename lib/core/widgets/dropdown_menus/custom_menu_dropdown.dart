import 'package:flutter/material.dart';
import '../../app_config/app_color.dart';
import '../../routes/navigator_extenstions.dart';

class CustomMenuDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String>? onSelected;
  final bool readOnly;
  final EdgeInsets? insetPadding;

  const CustomMenuDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.onSelected,
    this.readOnly = false,
    this.insetPadding,
  });

  @override
  State<CustomMenuDropdown> createState() => _CustomMenuDropdownState();
}

class _CustomMenuDropdownState extends State<CustomMenuDropdown> {
  late String selectedValue;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.initialValue ??
        (widget.items.isNotEmpty ? widget.items.first : '');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showMenu(BuildContext context) async {
    if (widget.readOnly) return;

    String? selected = await showDialog<String>(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding:
              widget.insetPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 100, maxHeight: 400),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.separated(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: widget.items.length,
                  separatorBuilder: (_, __) =>
                      Divider(height: 1, color: AppColor.blackColor),
                  itemBuilder: (_, index) {
                    final item = widget.items[index];
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
          ),
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
              // ignore: deprecated_member_use
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
              child: Center(
                child: Text(
                  selectedValue,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: widget.readOnly
                        ? AppColor.blackColor.withOpacity(0.6)
                        : AppColor.blackColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            if (!widget.readOnly)
              Image.asset(
                "assets/images/home/cashout/dropdown_arrow.png",
                width: 25,
                height: 25,
              ),
          ],
        ),
      ),
    );
  }
}
