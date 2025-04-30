

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/item.dart';

final ItemProvider=StateNotifierProvider<ItemNotifier, List<Item>>((ref){

  return ItemNotifier();
}
);

class ItemNotifier extends StateNotifier<List<Item>>{

  ItemNotifier():super([]);


  //Here we will add functions latter on
   void addItem(String name){
     final item=Item(id: DateTime.now().toString(), name: name);
     state.add(item);
     state=state.toList();
   }
 //Delete Function
  void deleteItem(String id){
     state.removeWhere((item)=>item.id==id);
     state=state.toList();

  }

  //Update
  void UpdateItem(String id, String name){
    final foundIndex=state.indexWhere((item)=>item.id==id);
    state[foundIndex].name=name;
    state=state.toList();

  }

}