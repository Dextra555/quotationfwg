import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerLoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class QuestionnaireShimmer extends StatelessWidget {
  const QuestionnaireShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title shimmer
        ShimmerLoadingWidget(
          width: double.infinity,
          height: 24,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 8),
        
        // Question shimmers
        ...List.generate(5, (index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question text shimmer
              ShimmerLoadingWidget(
                width: double.infinity,
                height: 16,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 8),
              
              // Input field shimmer
              ShimmerLoadingWidget(
                width: double.infinity,
                height: 48,
                borderRadius: BorderRadius.circular(6),
              ),
            ],
          ),
        )),
        
        // Button shimmer
        ShimmerLoadingWidget(
          width: double.infinity,
          height: 48,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}

class TemplateDropdownShimmer extends StatelessWidget {
  const TemplateDropdownShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label shimmer
        ShimmerLoadingWidget(
          width: 120,
          height: 16,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 8),
        
        // Dropdown shimmer
        ShimmerLoadingWidget(
          width: double.infinity,
          height: 48,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}
