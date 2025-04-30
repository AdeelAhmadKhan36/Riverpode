import 'package:riverpod/riverpod.dart';

import '../../view_model/item.dart' show Item;
import '../view_model/fav_items.dart';
import 'fav_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filterItems: [], Search: ''));

  void addItem() {
    List<FavItem> item = [
      FavItem(name: "HP Spectre", id: 1, favourite: true),
      FavItem(name: "Macbook", id: 2, favourite: false),
      FavItem(name: "Iphone", id: 3, favourite: false),
      FavItem(name: "Android", id: 4, favourite: true),
      FavItem(name: "Apple Watch", id: 5, favourite: true),
    ];

    state = state.copyWith(allItems: item.toList(), filterItems: item.toList());
  }

  void filterList(String Search) {
    state = state.copyWith(filterItems: _filterItems(state.allItems, Search));
  }

  List<FavItem> _filterItems(List<FavItem> items, String Search) {
    if (Search.isEmpty) {
      return items;
    }
    return items
        .where(
          (items) => items.name.toLowerCase().contains(Search.toLowerCase()),
        )
        .toList();
  }

  //Favitem
  void Favourite(String option) {
    state = state.copyWith(filterItems: _favouriteItem(state.allItems, option));
  }

  List<FavItem> _favouriteItem(List<FavItem> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items
        .where(
          (items) => items.favourite==true).toList();

  }
}
