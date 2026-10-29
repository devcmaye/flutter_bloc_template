import 'package:flutter/material.dart';

import '../../app_config/app_fonts_style.dart';
import '../common/custom_text.dart';

class DropdownAccountItem {
  final String title;
  final String amount;
  final IconData icon;

  const DropdownAccountItem({
    required this.title,
    required this.amount,
    this.icon = Icons.account_circle_outlined,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownAccountItem &&
          title == other.title &&
          amount == other.amount;

  @override
  int get hashCode => Object.hash(title, amount);
}

class AccountMenuDropdown extends StatefulWidget {
  final List<DropdownAccountItem> items;
  final DropdownAccountItem? initialValue;
  final ValueChanged<DropdownAccountItem>? onSelected;
  final bool readOnly;
  final EdgeInsets? insetPadding;
  final String hint;

  const AccountMenuDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.onSelected,
    this.readOnly = false,
    this.insetPadding,
    this.hint = " ---- Select Account ---- ",
  });

  @override
  State<AccountMenuDropdown> createState() => _AccountMenuDropdownState();
}

class _AccountMenuDropdownState extends State<AccountMenuDropdown> {
  DropdownAccountItem? _selected;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant AccountMenuDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue) {
      _selected = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _showMenu() async {
    if (widget.readOnly) return;

    final result = await showDialog<DropdownAccountItem>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          insetPadding:
              widget.insetPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: widget.items.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Colors.grey.shade300),
                itemBuilder: (_, index) {
                  final item = widget.items[index];

                  return InkWell(
                    onTap: () => Navigator.pop(context, item),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Icon(item.icon, color: Colors.grey),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),

                          CustomText(
                            text: item.amount,
                            fontWeight: AppFontWeight.semiBold,
                            fontSize: AppFontsSize.body,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selected = result;
      });

      widget.onSelected?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showMenu,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: widget.readOnly ? Colors.grey.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: _selected == null
            ? Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: _selected?.title ?? widget.hint,
                      fontWeight: AppFontWeight.regular,
                      fontSize: AppFontsSize.body,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),

                  if (!widget.readOnly) const Icon(Icons.keyboard_arrow_down),
                ],
              )
            : Row(
                children: [
                  Icon(_selected!.icon, color: Colors.grey, size: 20),

                  const SizedBox(width: 12),

                  Expanded(
                    child: CustomText(
                      text: _selected!.title,
                      fontWeight: AppFontWeight.medium,
                      fontSize: AppFontsSize.bodySmall,
                    ),
                  ),

                  CustomText(
                    text: _selected!.amount,
                    fontWeight: AppFontWeight.semiBold,
                    fontSize: AppFontsSize.bodySmall,
                  ),
                  SizedBox(width: 8),
                  if (!widget.readOnly) const Icon(Icons.keyboard_arrow_down),
                ],
              ),
      ),
    );
  }
}
