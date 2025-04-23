

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter= StateProvider<int>((ref){

return 0;
});


final Swicther= StateProvider<bool>((ref){

  return false;
});


class CounterApp extends ConsumerWidget {
   CounterApp({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Counter App",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
            Consumer(builder: (context , ref, child)
            {
              final count=ref.watch(counter);
              bool sw=ref.watch(Swicther);

              print("Build One");
              return  Center(
                child: Column(
                  children: [
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                      ),
                    ),
                    Switch(value: sw, onChanged: (value){
                        ref.read(Swicther.notifier).state=value;

                    })
                  ],
                ),
              );

            })

        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
           ref.read(counter.notifier).state++;


      },

      child: Icon(Icons.add),
      ),

    );
  }
}
