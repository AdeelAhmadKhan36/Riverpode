import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stream_provider.dart';


class Stream_Home extends ConsumerWidget {
  const Stream_Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build");



    return  Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Stream ",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),

      body: Consumer(builder: (context, ref, child){
        final futureprovider=ref.watch(socketPriceProvider);


        return Center(
          child: futureprovider.when(
            skipLoadingOnRefresh: false,
            data: (price)=>Text(price.toStringAsFixed(2).toString(),style: TextStyle(

                fontSize: 40, fontWeight: FontWeight.bold
            ),),
            error: (error, stack)=>TextButton(
              onPressed: (){
                ref.invalidate(socketPriceProvider);
              },
               child: Text ("Error: $error")),
            loading: ()=>CircularProgressIndicator(),

          ),
        );
      })




    );
  }
}
