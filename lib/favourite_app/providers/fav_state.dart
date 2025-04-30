import '../../view_model/item.dart';
import '../view_model/fav_items.dart';

class FavouriteState{

  final List<FavItem> allItems;
  final List<FavItem>filterItems;
  final String Search;


  FavouriteState( {required this.allItems, required this.filterItems,required this.Search,});



  FavouriteState copyWith({
   List<FavItem>? allItems,
    List<FavItem>?filterItems,
    String ?Search,

}){

    return FavouriteState(
        allItems: allItems??this.allItems,
        filterItems: filterItems?? this.filterItems,
        Search: Search?? this.Search
    );
  }

}