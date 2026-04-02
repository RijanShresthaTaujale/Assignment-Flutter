import 'dart:convert';
import 'main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_state.dart';
import 'package:http/http.dart' as http;

class PostCubit extends Cubit<PostState>{
  PostCubit(): super(PostLoading());

  Future<void> fetchPosts() async{
    try{
      emit(PostLoading());

      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      final List data = jsonDecode(response.body);

      final posts = data.map((item) => Post.fromJson(item)).toList();
      
      emit(PostLoaded(posts));
    } catch(e){
      emit(PostError());
    }
  }
}