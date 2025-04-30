
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_statmanagment/Get_API/model/api_model.dart';
class get_home extends ConsumerWidget {
  const get_home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postlist=ref.watch(postProvider);
    return Scaffold(


      appBar: AppBar(
        title: Center(child: Text("Get API",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),

      body: Center(
        child: postlist.when(
          skipLoadingOnRefresh: false,
            data: (data)=>Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: data.length,
                  itemBuilder: (context, index){
                    final item=data[index];
                    return Card(
                      child: ListTile(
                        leading: Text(item.id.toString()),
                        title: Text(item.title),
                        subtitle: Text(item.body),
                      ),
                    );
                  }),
            ),
            error: (error, stack)=>TextButton(

                onPressed: (){
                  ref.invalidate(postProvider);
                },
                child: Text("Error: $error"),
            ),
            loading:()=> CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
          final json={
            "userId": 1,
            "id": 1,
            "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
          };
        PostModel postModel=PostModel.fromJson(json);
         print(postModel.title);

      },
      child: Icon(Icons.add),
      ),

    );
  }
}
