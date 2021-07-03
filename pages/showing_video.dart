import 'package:flutter/material.dart';
import 'package:you_tube/bloc/page_bloc.dart';
import 'package:you_tube/data.dart';
import 'package:you_tube/models/channel.dart';
import 'package:you_tube/models/playlist_item.dart';
import 'package:you_tube/models/video.dart';
import 'package:you_tube/services/channel_service.dart';
import 'package:you_tube/services/video_service.dart';
import 'package:you_tube/widgets/featured_icon.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ShowingVideo extends StatefulWidget {
  const ShowingVideo({Key? key, required this.videoId, required this.video})
      : super(key: key);
  final String videoId;
  final Video video;

  @override
  _ShowingVideoState createState() => _ShowingVideoState();
}

class _ShowingVideoState extends State<ShowingVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    print('video id ${widget.videoId}');
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: YoutubePlayerFlags(mute: false, autoPlay: true));
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToHomePage());
        return Future.value(false);
        //return;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: size.width,
                  height: size.height * 0.3,
                  color: Colors.green[600],
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  )),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: size.width - 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width - 70,
                        child: Text(widget.video.title,
                            style: TextStyle(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.clip),
                      ),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 36,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${NumberFormat.compact(locale: 'en_US').format(widget.video.viewCount)} views',
                  style: TextStyle(color: Color(0xFFB9B9B9), fontSize: 10),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FeaturedIcon(
                        icon: Icons.thumb_up_alt_outlined,
                        text:
                            '${NumberFormat.compact(locale: 'en_US').format(widget.video.likeCount)} likes',
                      ),
                      FeaturedIcon(
                        icon: Icons.thumb_down_alt_outlined,
                        text:
                            '${NumberFormat.compact(locale: 'en_US').format(widget.video.dislikeCount)} likes',
                      ),
                      FeaturedIcon(
                        icon: Icons.screen_share_outlined,
                        text: 'Share',
                      ),
                      FeaturedIcon(
                        icon: Icons.download_outlined,
                        text: 'Download',
                      ),
                      FeaturedIcon(
                        icon: Icons.library_books_outlined,
                        text: 'Save',
                      ),
                    ]),
              ),
              FutureBuilder(
                  future: ChannelService.getChannel(
                      channelId: widget.video.channelId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        var channel = snapshot.data as Channel;
                        return ListTile(
                          leading: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(channel.profilePict),
                                    fit: BoxFit.cover)),
                          ),
                          title: Text(
                            channel.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            '${NumberFormat.compact(locale: 'en_US').format(channel.subscriberCount)} Subscriber',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 11),
                          ),
                          trailing: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.red.shade400),
                              onPressed: () {},
                              child: Text(
                                'SUBSCRIBE',
                                style: TextStyle(fontSize: 18),
                              )),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }
                    return SizedBox.shrink();
                  }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Up Next'),
                    ),
                    Row(
                      children: [
                        Text('Autoplay'),
                        Switch(
                          value: true,
                          onChanged: (val) {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FutureBuilder(
                      future: VideoService.fetchVideos(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            var items =
                                (snapshot.data as List<Video>).sublist(3, 8);
                            return ListView.builder(
                                itemCount: items.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 0.35,
                                            height: 120,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        items[index]
                                                            .thumbnailPict),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            width: size.width * 0.45,
                                            height: 120,
                                            //color: Colors.green[300],
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  items[index].title,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  items[index].channelTitle,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFFB9B9B9)),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                ),
                                                Text(
                                                  '${NumberFormat.compact(locale: 'en_US').format(items[index].viewCount)}M',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Color(0xFFB9B9B9)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Icon(Icons.more_vert_rounded)
                                        ],
                                      ),
                                    ));
                          }
                        }
                        return SizedBox.shrink();
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
