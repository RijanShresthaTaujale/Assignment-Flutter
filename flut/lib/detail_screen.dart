import 'package:flutter/material.dart';
import 'main.dart';

class DetailScreen extends StatelessWidget {
  final Post post;
  
  const DetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Post #${post.id}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('UserId: ${post.userId}' , style: TextStyle(fontSize: 16),),
                  SizedBox(height: 12),
                  Text('Id: ${post.id}' , style: TextStyle(fontSize: 16),),
                  SizedBox(height: 12),
                  Text('Title: ${post.title}' , style: TextStyle(fontSize: 20)),
                  SizedBox(height: 12),
                  Text('Body:' , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(post.body , style: TextStyle(fontSize: 16, height: 1.5)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}