import 'dart:convert';

import 'package:http/http.dart' as http;

import 'controller.dart';
import 'news_feed.dart';
class UserApi{
  static Future<void> fetchFeeds() async {
    final url = 'http://3.7.38.190:8000/feeds/?page_no=1&query=&stock_id=';
    final uri = Uri.parse(url);

    try {
      final res = await http.get(uri);

      if (res.statusCode == 200) {
        final body = res.body;
        final json = jsonDecode(body);

        final feeds = json['feeds'] as List<dynamic>;
        final transformed = feeds.map((e) {
          return User(title: e['title'] ?? 'No title',
            description: e['description'] ?? 'No description',
          );
        }).toList();

        user = transformed;
        print('wqq${user}');
      } else {
        print('Failed to load feeds: ${res.statusCode}');
      }
    } catch (e) {
      print('Error fetching feeds: $e');
    }
  }

}