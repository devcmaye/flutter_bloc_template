import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app_config/app_color.dart';
import '../../extensions/focus_extensions.dart';
import '../../routes/navigator_extenstions.dart';

class BestMenuDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? initialValue;
  final String Function(T) itemLabel;
  final ValueChanged<T>? onSelected;
  final bool readOnly;
  final EdgeInsets? insetPadding;
  final double maxHeight;
  final Widget? emptyWidget;
  final int borderRadius;
  final Color? borderColor;

  const BestMenuDropdown({
    super.key,
    required this.items,
    required this.itemLabel,
    this.initialValue,
    this.onSelected,
    this.readOnly = false,
    this.insetPadding,
    this.maxHeight = 400,
    this.emptyWidget,
    this.borderRadius = 8,
    this.borderColor,
  });

  @override
  State<BestMenuDropdown<T>> createState() => _BestMenuDropdownState<T>();
}

class _BestMenuDropdownState<T> extends State<BestMenuDropdown<T>> {
  final ScrollController _scrollController = ScrollController();

  late T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = _getSelectedValue();
  }

  @override
  void didUpdateWidget(covariant BestMenuDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!listEquals(widget.items, oldWidget.items) ||
        widget.initialValue != oldWidget.initialValue) {
      setState(() {
        selectedValue = _getSelectedValue();
      });
    }
  }

  T? _getSelectedValue() {
    if (widget.items.isEmpty) return null;

    if (widget.initialValue != null &&
        widget.items.contains(widget.initialValue)) {
      return widget.initialValue;
    }

    return widget.items.first;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _showMenu() async {
    if (widget.readOnly || widget.items.isEmpty) return;

    context.dismissKeyboard();

    final T? selected = await showDialog<T>(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding:
              widget.insetPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 150,
              maxHeight: widget.maxHeight,
            ),
            child: widget.items.isEmpty
                ? widget.emptyWidget ??
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('No Data'),
                        ),
                      )
                : Scrollbar(
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
                        final bool isSelected = item == selectedValue;

                        return InkWell(
                          onTap: () => context.pop(item),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            color: isSelected
                                ? AppColor.primaryColor.withOpacity(.08)
                                : Colors.transparent,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.itemLabel(item),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(Icons.check, size: 18),
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

    if (selected != null && mounted) {
      setState(() {
        selectedValue = selected;
      });

      widget.onSelected?.call(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showMenu,
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: widget.readOnly
              ? AppColor.whiteColor.withOpacity(.7)
              : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                widget.borderColor ??
                (widget.readOnly
                    ? AppColor.blackColor.withValues(alpha: 0.3)
                    : AppColor.blackColor.withValues(alpha: 0.4)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedValue == null
                    ? ''
                    : widget.itemLabel(selectedValue as T),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: widget.readOnly
                      ? AppColor.blackColor.withOpacity(.6)
                      : AppColor.blackColor,
                  fontSize: 13,
                ),
              ),
            ),
            if (!widget.readOnly)
              Image.asset(
                "assets/images/home/cashout/dropdown_arrow.png",
                width: 24,
                height: 24,
              ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:payme_pension_agent_application/core/extensions/focus_extensions.dart';
// import 'package:payme_pension_agent_application/core/routes/navigator_extenstions.dart';
// import '../../app_config/app_color.dart';

// class CustomMenuDropdown extends StatefulWidget {
//   final List<String> items;
//   final String? initialValue;
//   final ValueChanged<String>? onSelected;
//   final bool readOnly;
//   final EdgeInsets? insetPadding;

//   const CustomMenuDropdown({
//     super.key,
//     required this.items,
//     this.initialValue,
//     this.onSelected,
//     this.readOnly = false,
//     this.insetPadding,
//   });

//   @override
//   State<CustomMenuDropdown> createState() => _CustomMenuDropdownState();
// }

// class _CustomMenuDropdownState extends State<CustomMenuDropdown> {
//   late String selectedValue;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     selectedValue =
//         widget.initialValue ??
//         (widget.items.isNotEmpty ? widget.items.first : '');
//   }

//   @override
//   void didUpdateWidget(covariant CustomMenuDropdown oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (widget.initialValue != oldWidget.initialValue ||
//         widget.items != oldWidget.items) {
//       setState(() {
//         selectedValue =
//             widget.initialValue ??
//             (widget.items.isNotEmpty ? widget.items.first : '');
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _showMenu(BuildContext context) async {
//     if (widget.readOnly) return;

//     context.dismissKeyboard();
//     String? selected = await showDialog<String>(
//       context: context,
//       builder: (_) {
//         return Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           insetPadding:
//               widget.insetPadding ??
//               const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white,
//             ),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(minWidth: 100, maxHeight: 400),
//               child: Scrollbar(
//                 controller: _scrollController,
//                 thumbVisibility: true,
//                 child: ListView.separated(
//                   controller: _scrollController,
//                   shrinkWrap: true,
//                   itemCount: widget.items.length,
//                   separatorBuilder:
//                       (_, __) => Divider(height: 1, color: AppColor.blackColor),
//                   itemBuilder: (_, index) {
//                     final item = widget.items[index];
//                     return InkWell(
//                       onTap: () => context.pop(item),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 12,
//                           horizontal: 10,
//                         ),
//                         child: Center(
//                           child: Text(
//                             item,
//                             style: const TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     if (selected != null) {
//       setState(() => selectedValue = selected);
//       widget.onSelected?.call(selected);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _showMenu(context),
//       child: Container(
//         padding: const EdgeInsets.only(left: 3, right: 12, top: 8, bottom: 8),
//         decoration: BoxDecoration(
//           color:
//               widget.readOnly
//                   // ignore: deprecated_member_use
//                   ? AppColor.whiteColor.withOpacity(0.7)
//                   : AppColor.whiteColor,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color:
//                 widget.readOnly
//                     ? AppColor.blackColor.withOpacity(0.3)
//                     : AppColor.blackColor.withOpacity(0.4),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Center(
//                 child: Text(
//                   selectedValue,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color:
//                         widget.readOnly
//                             ? AppColor.blackColor.withOpacity(0.6)
//                             : AppColor.blackColor,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//             ),

//             if (!widget.readOnly)
//               Image.asset(
//                 "assets/images/home/cashout/dropdown_arrow.png",
//                 width: 25,
//                 height: 25,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
