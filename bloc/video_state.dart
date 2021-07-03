part of 'video_bloc.dart';

abstract class VideoState extends Equatable {}

class VideoInitial extends VideoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VideoLoaded extends VideoState {
  final List<Video> videos;
  VideoLoaded(this.videos);
  @override
  List<Object?> get props => videos;
}
