import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:you_tube/models/video.dart';
import 'package:you_tube/services/video_service.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial());

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is LoadVideo) {
      List<Video> videos = await VideoService.fetchVideos();
      yield VideoLoaded(videos);
    }
  }
}
