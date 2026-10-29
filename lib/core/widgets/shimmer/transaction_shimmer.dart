import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TransactionShimmer extends StatelessWidget {
  const TransactionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: 6, // number of shimmer rows
      itemBuilder: (_, __) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: _TransactionShimmerItem(),
        );
      },
    );
  }
}

class _TransactionShimmerItem extends StatelessWidget {
  const _TransactionShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(width: 120, height: 10, color: Colors.white),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Container(width: 70, height: 12, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
