import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_tube/bloc/channel_bloc.dart';
import 'package:you_tube/components/bottom_nav.dart';
import 'package:you_tube/components/header.dart';
import 'package:you_tube/components/history_subtitle.dart';
import 'package:you_tube/models/playlist_item.dart';
import 'package:you_tube/services/video_service.dart';
import 'package:you_tube/widgets/shimmer_video_small_thumbnail.dart';
import 'package:you_tube/widgets/video_small_thumbnail.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: 2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Header(),
          Expanded(
            child: ListView(
              children: [
                HistorySubTitle(
                  title: 'Recent',
                  icon: Icons.keyboard_arrow_down_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: BlocBuilder<ChannelBloc, ChannelState>(
                      builder: (context, state) {
                        if (state is ChannelLoaded) {
                          return FutureBuilder(
                              future: VideoService.recentVideos(
                                  playlistId: 'UU_x5XG1OV2P6uZZ5FSM9Ttw',
                                  first: 0,
                                  last: 4),
                              initialData: [],
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    var items =
                                        snapshot.data as List<PlaylistItem>;
                                    return ListView.builder(
                                      itemCount: items.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          VideoSmallThumbnail(
                                        index: index,
                                        imageUrl: items[index].thumbnailUrl,
                                        title: items[index].title,
                                        subtitle: items[index].channelTitle,
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Text('no data loaded'),
                                    );
                                  }
                                }
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) =>
                                        ShimmerVideoSmallThumbnail(
                                          index: index,
                                        ));
                              });
                        }
                        return SizedBox.shrink();
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                HistorySubTitle(
                  title: 'Watch Later',
                  icon: Icons.keyboard_arrow_down_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: FutureBuilder(
                      future: VideoService.recentVideos(
                          playlistId: 'UU_x5XG1OV2P6uZZ5FSM9Ttw',
                          first: 3,
                          last: 6),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            var items = snapshot.data as List<PlaylistItem>;
                            return ListView.builder(
                              itemCount: items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  VideoSmallThumbnail(
                                index: index,
                                imageUrl: items[index].thumbnailUrl,
                                title: items[index].title,
                                subtitle: items[index].channelTitle,
                              ),
                            );
                          } else {
                            return Center(
                              child: Text('No Data Loaded'),
                            );
                          }
                        }
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                ShimmerVideoSmallThumbnail(
                                  index: index,
                                ));
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                HistorySubTitle(
                  title: 'Liked Video',
                  icon: Icons.keyboard_arrow_down_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: FutureBuilder(
                      future: VideoService.recentVideos(
                          playlistId: 'UU_x5XG1OV2P6uZZ5FSM9Ttw',
                          first: 5,
                          last: 9),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            var items = snapshot.data as List<PlaylistItem>;
                            return ListView.builder(
                              itemCount: items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  VideoSmallThumbnail(
                                index: index,
                                imageUrl: items[index].thumbnailUrl,
                                title: items[index].title,
                                subtitle: items[index].channelTitle,
                              ),
                            );
                          } else {
                            return Center(
                              child: Text('No Data Loaded'),
                            );
                          }
                        }
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                ShimmerVideoSmallThumbnail(
                                  index: index,
                                ));
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                HistorySubTitle(
                  title: 'Purchase',
                  icon: Icons.keyboard_arrow_down_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: FutureBuilder(
                      future: VideoService.recentVideos(
                          playlistId: 'UU_x5XG1OV2P6uZZ5FSM9Ttw',
                          first: 8,
                          last: 12),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            var items = snapshot.data as List<PlaylistItem>;
                            return ListView.builder(
                              itemCount: items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  VideoSmallThumbnail(
                                index: index,
                                imageUrl: items[index].thumbnailUrl,
                                title: items[index].title,
                                subtitle: items[index].channelTitle,
                              ),
                            );
                          } else {
                            return Center(
                              child: Text('No Data Loaded'),
                            );
                          }
                        }
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                ShimmerVideoSmallThumbnail(
                                  index: index,
                                ));
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
