import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TransactionDetailShimmer extends StatelessWidget {
  final int itemCount;

  const TransactionDetailShimmer({super.key, this.itemCount = 8});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const ShimmerContainer(height: 16, width: 160),
                      const SizedBox(height: 16),

                      const ShimmerContainer(height: 30, width: 120),
                      const SizedBox(height: 8),

                      const ShimmerContainer(height: 16, width: 100),
                      const SizedBox(height: 16),

                      ...List.generate(
                        itemCount,
                        (_) => const TransactionDetailRowShimmer(),
                      ),
                    ],
                  ),
                ),

                const Positioned(
                  top: -5,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(radius: 25, backgroundColor: Colors.grey),
                ),
              ],
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.all(16),
              child: ShimmerContainer(height: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionDetailRowShimmer extends StatelessWidget {
  const TransactionDetailRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ShimmerContainer(height: 14, width: 120),
          ShimmerContainer(height: 14, width: 140),
        ],
      ),
    );
  }
}

class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: child,
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius radius;

  const ShimmerContainer({
    super.key,
    required this.height,
    this.width,
    this.radius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
    );
  }
}
