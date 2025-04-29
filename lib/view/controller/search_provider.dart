





//Here We are going use RiverPode for multiple state

import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchprovider= StateNotifierProvider<SearchNotifier, SearchState>((ref){

  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState >{
             SearchNotifier():super(SearchState(search: '',  isChange: false ));


             void search(String query){
               state=state.copywith(search: query);
             }
             void isChnage(bool isChange){
               state=state.copywith(isChange: isChange);
             }
}

// Now we will work with multile states like here
//We are using string it will be converetd into multiple states
class SearchState{
  final String search;
  final bool isChange;


  SearchState( {required this.search,required this.isChange,});

  SearchState copywith({
    String?search,
    bool?isChange
}){
    return SearchState(
      search:search?? this.search,
      isChange:isChange??this.isChange,
    );
  }
}