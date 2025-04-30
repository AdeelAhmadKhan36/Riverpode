
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_statmanagment/favourite_app/providers/favourite_provoder.dart';
class FavouriteHome extends ConsumerWidget {
  const FavouriteHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favList=ref.watch(favouriteProvider);
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Favourite App",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.white), // White dots

              onSelected: (value){
                ref.read(favouriteProvider.notifier).Favourite(value);

              },
              itemBuilder: (BuildContext contex){

            return const[
              PopupMenuItem(
                  value: "All",
                  child: Text("All")),

              PopupMenuItem(
                  value: "Favourite",
                  child: Text("Favourite"))
            ];
          })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value){
                ref.read(favouriteProvider.notifier).filterList(value);

              },
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: favList.filterItems.length,

                itemBuilder: (context, index){
                  final item=favList.filterItems[index];
              return ListTile(
                title: Text(item.name),
                trailing: Icon(item.favourite?Icons.favorite:Icons.favorite_border),

              );

            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
          ref.read(favouriteProvider.notifier).addItem();
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
