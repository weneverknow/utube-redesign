import 'package:equatable/equatable.dart';

class PlaylistItem extends Equatable {
  final String id;
  final String thumbnailUrl;
  final String title;
  final String channelTitle;
  final String highPict;
  PlaylistItem(
      {required this.id,
      required this.thumbnailUrl,
      required this.title,
      required this.channelTitle,
      this.highPict = ''});
  factory PlaylistItem.fromMap(Map<String, dynamic> obj) {
    return PlaylistItem(
        id: obj['contentDetails']['videoId'],
        channelTitle: obj['snippet']['channelTitle'],
        thumbnailUrl: obj['snippet']['thumbnails']['medium']['url'],
        highPict: obj['snippet']['thumbnails']['high']['url'],
        title: obj['snippet']['title']);
  }
  @override
  List<Object?> get props => [id, thumbnailUrl, title, channelTitle];
}
