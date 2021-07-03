import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerVideoSmallThumbnail extends StatelessWidget {
  const ShimmerVideoSmallThumbnail({Key? key, this.index = 0})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.green
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Shimmer.fromColors(
            baseColor: Color(0xFFBBB9B9),
            highlightColor: Color(0xFFF5F5F5),
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
