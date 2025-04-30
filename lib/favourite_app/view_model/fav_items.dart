
class FavItem{

   final  String name;
    final int id;
    final bool favourite;


   FavItem({required this.name, required this.id, required this.favourite});

   FavItem copyWith({
     String? name,
     int ?id,
     bool ?favourite,

}){
      return FavItem(
          name: name?? this.name,
          id: id?? this.id,
          favourite: favourite??this.favourite


      );
    }
}