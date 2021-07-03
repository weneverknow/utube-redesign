import 'package:flutter/material.dart';

class VideoSmallThumbnail extends StatelessWidget {
  const VideoSmallThumbnail({
    required this.index,
    required this.imageUrl,
    required this.title,
    this.subtitle = '',
    Key? key,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  final String title;
  final String subtitle;

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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
              Icon(
                Icons.more_vert_outlined,
                size: 20,
              )
            ],
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 9, color: Color(0xFFB9B9B9)),
          )
        ],
      ),
    );
  }
}
