import 'package:riverpod/riverpod.dart';

final feature_provider=FutureProvider<List<String>>((ref)async{
  await Future.delayed(Duration(seconds: 2));

   return ["Adeel", "Khawar", "Umair"];
  // throw "No Internet";

});