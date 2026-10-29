import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TermsConditionShimmer extends StatelessWidget {
  const TermsConditionShimmer({super.key});

  Widget _shimmerBox({
    double? width,
    required double height,
    double radius = 4,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  Widget _infoRow() {
    return Row(
      children: [
        _shimmerBox(width: 100, height: 14),
        const SizedBox(width: 20),
        Expanded(child: _shimmerBox(height: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            _shimmerBox(width: 220, height: 24),

            const SizedBox(height: 20),

            // Paragraph
            _shimmerBox(height: 14),
            const SizedBox(height: 10),

            _shimmerBox(height: 14),
            const SizedBox(height: 10),

            _shimmerBox(height: 14),
            const SizedBox(height: 10),

            _shimmerBox(
              width: MediaQuery.sizeOf(context).width * 0.85,
              height: 14,
            ),

            const SizedBox(height: 24),

            // Section title
            _shimmerBox(width: 180, height: 20),

            const SizedBox(height: 16),

            _shimmerBox(height: 14),
            const SizedBox(height: 10),

            _shimmerBox(height: 14),
            const SizedBox(height: 10),

            _shimmerBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: 14,
            ),

            const SizedBox(height: 28),

            // Another section
            _shimmerBox(width: 200, height: 20),

            const SizedBox(height: 16),

            ...List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _shimmerBox(
                  width: index == 4
                      ? MediaQuery.sizeOf(context).width * 0.75
                      : null,
                  height: 14,
                ),
              );
            }),

            const SizedBox(height: 32),

            // Agent information
            _shimmerBox(width: 180, height: 20),

            const SizedBox(height: 20),

            _infoRow(),
            const SizedBox(height: 12),

            _infoRow(),
            const SizedBox(height: 12),

            _infoRow(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
