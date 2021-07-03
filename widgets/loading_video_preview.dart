import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingVideoPreview extends StatelessWidget {
  const LoadingVideoPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Shimmer.fromColors(
            baseColor: Color(0xFFBBB9B9),
            highlightColor: Color(0xFFF5F5F5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                // color: Colors.yellowAccent.shade200
                //     .withOpacity(0.3),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Color(0xFFC0C0C0),
                highlightColor: Color(0xFFF5F5F5),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Color(0xFFC0C0C0),
                    highlightColor: Color(0xFFF5F5F5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Shimmer.fromColors(
                    baseColor: Color(0xFFC0C0C0),
                    highlightColor: Color(0xFFF5F5F5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                ],
              ),
              Shimmer.fromColors(
                baseColor: Color(0xFFC0C0C0),
                highlightColor: Color(0xFFF5F5F5),
                child: Container(
                  margin: EdgeInsets.only(right: 2),
                  height: 24,
                  width: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
