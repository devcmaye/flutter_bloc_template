import 'package:flutter/material.dart';

import 'common/custom_text.dart';

class BalanceCard extends StatelessWidget {
  final String title;
  final String amount;
  final String currency;
  final bool isBalanceVisible;
  final VoidCallback onToggleVisibility;
  final List<Color>? gradientColors;

  const BalanceCard({
    super.key,
    required this.title,
    required this.amount,
    required this.currency,
    required this.isBalanceVisible,
    required this.onToggleVisibility,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              gradientColors ?? const [Color(0xffE8FDFB), Color(0xffFFE6F2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(text: title, fontSize: 14, color: Colors.black54),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onToggleVisibility,
                child: Icon(
                  isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              CustomText(
                text: isBalanceVisible ? amount : "*********",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 10),
              CustomText(
                text: currency,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
