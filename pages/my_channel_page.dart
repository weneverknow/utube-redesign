import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_tube/bloc/channel_bloc.dart';
import 'package:you_tube/components/bottom_nav.dart';
import 'package:you_tube/components/header.dart';
import 'package:you_tube/data.dart';
import 'package:you_tube/models/playlist_item.dart';
import 'package:you_tube/models/video.dart';
import 'package:you_tube/services/video_service.dart';
import 'package:you_tube/widgets/category_title.dart';
import 'package:you_tube/widgets/video_small_thumbnail.dart';
import 'package:intl/intl.dart';

class MyChannelPage extends StatefulWidget {
  const MyChannelPage({Key? key}) : super(key: key);

  @override
  _MyChannelPageState createState() => _MyChannelPageState();
}

class _MyChannelPageState extends State<MyChannelPage> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: 3,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          Header(),
          Expanded(
            child: ListView(
              children: [
                BlocBuilder<ChannelBloc, ChannelState>(
                  builder: (context, state) {
                    if (state is ChannelLoaded) {
                      var channel = state.channel;
                      return Container(
                        width: size.width,
                        height: 185,
                        //padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            Image.network(
                              channel!.profileWallPict,
                              height: 130,
                              width: size.width,
                              fit: BoxFit.fitWidth,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white70,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      channel.profilePict),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              channel.title,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '${NumberFormat.compact(locale: 'en_US').format(channel.subscriberCount)} Subscribers',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFFB9B9B9)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red[700]),
                                          onPressed: () {},
                                          child: Text(
                                            'SUBSCRIBE',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 25,
                  //margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: categoryChannel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? 16 : 20,
                            right:
                                index == categoryChannel.length - 1 ? 16 : 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: selectedCategory == index
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                        : Colors.transparent))),
                        child: Text(
                          categoryChannel[index],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                    future: VideoService.getVideoById('oQAiKHhpNsQ'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          var item = snapshot.data as Video;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.yellowAccent.shade200
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage(item.thumbnailPict),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 35,
                                          //color: Colors.blueAccent,
                                          child: Text(
                                            item.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            //style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 25,
                                          //color: Colors.blueAccent[100],
                                          child: Text(
                                            '${item.channelTitle}.1 year ago.${item.viewCount} views',
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFB9B9B9)),
                                          ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.more_vert_rounded)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Text('no data loaded'),
                          );
                        }
                      }
                      return SizedBox.shrink();
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        'Most Liked Creator Videos |',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'REWIND 2019',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
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
                          first: 2,
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
                            return SizedBox.shrink();
                          }
                        }
                        return SizedBox.shrink();
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
