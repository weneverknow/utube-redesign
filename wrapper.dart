import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_tube/pages/history_page.dart';
import 'package:you_tube/pages/home_page.dart';
import 'package:you_tube/pages/my_channel_page.dart';
import 'package:you_tube/pages/showing_video.dart';

import 'bloc/page_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is HistoryPageLoaded) {
          return HistoryPage();
        } else if (state is ShowVideoPageLoaded) {
          return ShowingVideo(
            video: state.video,
            videoId: state.video.id,
          );
        } else if (state is ChannelPageLoaded) {
          return MyChannelPage();
        } else {
          return HomePage();
        }
        // return (state is HistoryPageLoaded)
        //     ? HistoryPage()
        //     : (state is ShowVideoPageLoaded
        //         ? ShowingVideo()
        //         : (state is ChannelPageLoaded ? MyChannelPage() : HomePage()));
      },
    );
  }
}
