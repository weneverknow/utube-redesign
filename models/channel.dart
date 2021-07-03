import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  final String id;
  final String title;
  final String profilePict;
  final int subscriberCount;
  final String playlistId;
  final String profileWallPict;

  Channel(
      {required this.id,
      required this.title,
      required this.profilePict,
      required this.subscriberCount,
      required this.playlistId,
      this.profileWallPict = ''});

  factory Channel.fromMap(Map<String, dynamic> obj) {
    return Channel(
        id: obj['id'],
        title: obj['snippet']['title'],
        profilePict: obj['snippet']['thumbnails']['default']['url'],
        profileWallPict: obj['snippet']['thumbnails']['high']['url'],
        subscriberCount:
            int.tryParse(obj['statistics']['subscriberCount']) ?? 0,
        playlistId: obj['contentDetails']['relatedPlaylists']['uploads']);
  }

  @override
  List<Object?> get props => [id, title, profilePict, subscriberCount];
}
