import 'package:you_tube/models/channel.dart';
import '../constant/api_key.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChannelService {
  static Future<Channel> getChannel({String? channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, statistics,contentDetails',
      'key': apiKey,
      'id': channelId ?? ''
    };
    Uri uri = Uri.https(baseUrl, '/youtube/v3/channels', parameters);
    Map<String, String> headers = {'headers': 'application/json'};
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      //print('response body ${response.body}');
      //print(data.toString());
      Channel channel = Channel.fromMap(data);
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  static Future<String> getUrlPicture(String id) async {
    return await getChannelPict(channelId: id);
  }

  static Future<String> getChannelPict({required String channelId}) async {
    String pictureUrl = '';
    Map<String, String> parameters = {
      'key': apiKey,
      'part': 'snippet',
      'id': channelId
    };
    Map<String, String> headers = {'headers': 'application/json'};
    Uri uri = Uri.https(baseUrl, '/youtube/v3/channels', parameters);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['items'][0];
      pictureUrl = data['snippet']['thumbnails']['default']['url'];
    } else {
      throw json.decode(response.body)['error']['message'];
    }
    return pictureUrl;
  }
}
