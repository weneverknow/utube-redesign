import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String title;
  final DateTime publishedAt;
  final String thumbnailPict;
  final String channelTitle;
  final int viewCount;
  final String? channelPict;
  final String channelId;
  final int? likeCount;
  final int? dislikeCount;

  set channelPict(String? val) {
    this.channelPict = val;
  }

  Video(
      {required this.id,
      required this.title,
      required this.publishedAt,
      required this.thumbnailPict,
      required this.channelTitle,
      required this.viewCount,
      required this.channelId,
      this.likeCount,
      this.dislikeCount,
      this.channelPict});

  factory Video.fromMap(Map<String, dynamic> obj) {
    return Video(
        id: obj['id'],
        title: obj['snippet']['title'],
        publishedAt: DateTime.tryParse(obj['snippet']['publishedAt'])!,
        thumbnailPict: obj['snippet']['thumbnails']['medium']['url'],
        channelTitle: obj['snippet']['channelTitle'],
        viewCount: int.tryParse(obj['statistics']['viewCount']) ?? 0,
        likeCount: int.tryParse(obj['statistics']['likeCount']) ?? 0,
        dislikeCount: int.tryParse(obj['statistics']['dislikeCount']) ?? 0,
        channelId: obj['snippet']['channelId']);
  }

  @override
  List<Object?> get props => [
        id,
        title,
        publishedAt,
        thumbnailPict,
        channelTitle,
        viewCount,
        channelPict
      ];
}
