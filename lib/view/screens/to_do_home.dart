
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_statmanagment/view/controller/item_provider.dart';
class ToDoHome extends ConsumerWidget {
  const ToDoHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemref=ref.watch(ItemProvider);
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("To DO App",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),
      body:itemref.isEmpty?Center(child: Text("No Data Found")):ListView.builder(
        itemCount: itemref.length,
          itemBuilder: (context, index){
          final itemDetail=itemref[index];
            return ListTile(
              title: Text(itemDetail.name, style: TextStyle(fontSize: 16),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    ref.read(ItemProvider.notifier).UpdateItem(itemDetail.id, "Updated Name");


                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){
                    ref.read(ItemProvider.notifier).deleteItem(itemDetail.id);


                  }, icon: Icon(Icons.delete_forever_outlined))
                ],
              ),

            );
          }

      ),

   floatingActionButton: FloatingActionButton(onPressed: (){
     ref.read(ItemProvider.notifier).addItem('Adeel Ahmad');
   }),

    );
  }
}
