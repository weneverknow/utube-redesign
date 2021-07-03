import 'package:you_tube/constant/api_key.dart';
import 'package:you_tube/models/channel.dart';
import 'package:you_tube/models/playlist_item.dart';
import 'package:you_tube/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:you_tube/services/channel_service.dart';

class VideoService {
  static Future<List<Video>> fetchVideos() async {
    Map<String, dynamic> parameters = {
      'key': apiKey,
      'pageToken': nextPageToken,
      'part': 'snippet, statistics, contentDetails',
      'maxResults': '8',
      'chart': 'mostPopular'
    };
    Map<String, String> headers = {'headers': 'application/json'};
    Uri url = Uri.https(baseUrl, '/youtube/v3/videos', parameters);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data);
      //nextPageToken = data['nextPageToken'];
      List<dynamic> videosMap = data['items'];
      print('data length ${videosMap.length}');
      //List<Video>? videos;

      return videosMap.map((video) => Video.fromMap(video)).toList();
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  static Future<Video> getVideoById(String id) async {
    Map<String, dynamic> parameters = {
      'key': apiKey,
      'pageToken': nextPageToken,
      'part': 'snippet, statistics, contentDetails',
      'maxResults': '1',
      //'chart': 'mostPopular',
      'id': id
    };
    Map<String, String> headers = {'headers': 'application/json'};
    Uri url = Uri.https(baseUrl, '/youtube/v3/videos', parameters);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data);
      //nextPageToken = data['nextPageToken'];
      //List<dynamic> videosMap = data['items'][0];
      //print('data length ${videosMap.length}');
      //List<Video>? videos;
      return Video.fromMap(data['items'][0]);
      //return videosMap.map((video) => Video.fromMap(video)).toList();
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  static Future<List<PlaylistItem>> recentVideos(
      {String? playlistId, int? first, int? last}) async {
    Map<String, dynamic> parameters = {
      'key': apiKey,
      //'pageToken': nextPageToken,
      'part': 'snippet, contentDetails',
      'maxResults': '25',
      'playlistId': playlistId ?? ''
    };
    print('playlistId : $playlistId');
    Map<String, String> headers = {'headers': 'application/json'};

    Uri uri = Uri.https(baseUrl, '/youtube/v3/playlistItems', parameters);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      //print(response.body);
      //print(json.decode(response.body)['items']);
      var data = json.decode(response.body);
      //nextPageToken = data['nextPageToken'];
      print(data['items']);
      List<dynamic> playlistItems = data['items'];
      List<PlaylistItem> items = [];
      //List<dynamic> data = json.decode(response.body)['items'];
      print('length ${playlistItems.length}');
      //print('title : ${playlistItems[5]['snippet']['title']}');
      int i = 0;
      // playlistItems.forEach((item) {
      //   //items.add(PlaylistItem.fromMap(item));
      //   //print(playlistItems[i]['snippet']['title']);
      //   print(item['contentDetails']['videoId']);
      //   print(item['snippet']['title']);
      //   print(item['snippet']['channelTitle']);
      //   print(item['snippet']['thumbnails']['default']['url']);

      //   //print(i);
      //   i++;
      // });
      //playlistItems.map((e) => null)
      print('items length ${items.length}');
      //return items;
      return playlistItems
          .map((item) => PlaylistItem.fromMap(item))
          .toList()
          .sublist(first ?? 0, last);
      //.sublist(first ?? 0, last);
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
