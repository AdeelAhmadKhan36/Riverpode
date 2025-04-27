
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpode_statmanagment/view/controller/search_provider.dart';
class Home_Screen extends ConsumerWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //You have Creagted SearchNotrifier for the state now for utilizing here yoiu jsut have to watch it

    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Counnter App",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(
            onChanged: (value){
              ref.read(searchprovider.notifier).search(value);
            },
          ),
          Consumer(builder: (context, ref ,child ){
            final searching =ref.watch(searchprovider);

            return           Text(searching.search);

          })
        ],
      ),

    );
  }
}
