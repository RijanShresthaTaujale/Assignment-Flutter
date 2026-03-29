import 'package:flut/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(MyApp());
}

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchPosts();
  }
    Future<void> fetchPosts() async {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      final List data = jsonDecode(response.body);

      setState((){
        posts = data.map((item) => Post.fromJson(item)).toList();
        isLoading = false;
      });
    }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Task"), centerTitle: true),
        body: isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index){
            final post = posts[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(post: post)
                    ),
                );
              },
              child:  Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Id: ${post.id} |' + ' Title: ${post.title}' , style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            );
          },
        ),
      ),
    );
  }
}