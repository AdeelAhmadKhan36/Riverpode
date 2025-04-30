import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_statmanagment/view/screens/counter.dart';
import 'package:riverpode_statmanagment/view/screens/home.dart';
import 'package:riverpode_statmanagment/view/screens/provider_in_riverpode.dart';
import 'package:riverpode_statmanagment/view/screens/slider_provider.dart';
import 'package:riverpode_statmanagment/view/screens/to_do_home.dart';

import 'favourite_app/view/favourite_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:FavouriteHome(),
      ),
    );
  }
}

