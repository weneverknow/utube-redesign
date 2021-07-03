import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:you_tube/bloc/page_bloc.dart';
import 'package:you_tube/bloc/video_bloc.dart';
import 'package:you_tube/components/bottom_nav.dart';
import 'package:you_tube/components/header.dart';
import 'package:you_tube/models/video.dart';
import 'package:you_tube/services/channel_service.dart';
import 'package:you_tube/services/video_service.dart';
import 'package:you_tube/widgets/category_title.dart';
import 'package:you_tube/widgets/loading_video_preview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Header(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CategoryTitle(
              title: 'Recommended',
            ),
          ),
          Expanded(
              child: SizedBox(
            child: FutureBuilder(
                future: VideoService.fetchVideos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var video = snapshot.data as List<Video>;

                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: video.length,
                          itemBuilder: (context, index) => FutureBuilder(
                              future: ChannelService.getChannelPict(
                                  channelId: video[index].channelId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    var pict = snapshot.data;

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, bottom: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context.read<PageBloc>().add(
                                                  GoToShowVideoPage(
                                                      video[index]));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.white
                                                            .withOpacity(0.1),
                                                        offset: Offset(0, 0),
                                                        spreadRadius: 0,
                                                        blurRadius: 4)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          video[index]
                                                              .thumbnailPict),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 38,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              pict as String),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      child: Text(
                                                        video[index].title,
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      height: 25,
                                                      child: Text(
                                                        '${video[index].channelTitle}.1 day ago.${NumberFormat.compact(locale: 'en_US').format(video[index].viewCount)} views',
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xFFB9B9B9)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Icon(Icons.more_vert_rounded)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                                return LoadingVideoPreview();
                              }));
                    } else {
                      return Center(
                        child: Text('have no data'),
                      );
                    }
                  }
                  return ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => LoadingVideoPreview());
                }),
          )),
        ],
      ),
    );
  }
}
