import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller.dart';
import 'modul.dart';

 // Make sure to import your FeedController



class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});



  @override
  State<FeedScreen> createState() => _FeedScreenState();
}
List<User> user=[];
class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserApi.fetchFeeds();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView.builder(itemCount:user.length, itemBuilder: ( context,  index) {
        final users=user[index];


        return ListTile(
          title: Text(users.title),
          subtitle: Text(users.description),


        );
      },)
      );

  }
}






// void fetchFeeds() async {
//   final url = 'http://3.7.38.190:8000/feeds/?page_no=1&query=&stock_id=';
//   final Url=Uri.parse(url);
//   final res=await http.get(Url);
//   final body=res.body;
//   final json=jsonDecode(body);
//
//   final feeds=json['feeds'] as List<dynamic>;
// final transformared=feeds.map((e){
//   return User(title: e('title'));
//
// }).toList();
//
//
//  user=transformared;
//
//  print('dsds');
//
//
// }

