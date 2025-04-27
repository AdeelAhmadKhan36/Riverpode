





//Here We are going use RiverPode for multiple state

import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchprovider= StateNotifierProvider<SearchNotifier, SearchState>((ref){

  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState >{
             SearchNotifier():super(SearchState(search: ""));


             void search(String query){
               state=state.copywith(search: query);
             }
}

// Now we will work with multile states like here
//We are using string it will be converetd into multiple states
class SearchState{
  final String search;

  SearchState({required this.search});

  SearchState copywith({
    String?search
}){
    return SearchState(
      search:search?? this.search,
    );
  }
}