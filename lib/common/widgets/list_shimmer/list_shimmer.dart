import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  const ListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.black12,
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 16,
                    cornerSmoothing: 1,
                  ),
                ),
              ),
              height: 80.0,
            ),
          ),
        );
      }),
    );
  }
}
