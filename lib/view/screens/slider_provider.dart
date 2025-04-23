

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/slider_pro.dart';

class SliderScreen extends ConsumerWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print("Hello");

    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Slider",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),
   body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [

           Consumer(builder: (context, ref , child){
             final slider=ref.watch(Slider_provider);

             print("Contaier");
             return        Container(
               height: 200,
               width: 200,
               color: Colors.red.withOpacity(slider),
             );

           }),

       Consumer(builder: (context, ref , child){
         final slider=ref.watch(Slider_provider);

         print("Slider");

         return        Slider(value: slider, onChanged: (value){
           ref.read(Slider_provider.notifier).state=value;
         });

       }),

     ],
   ),
    );
  }
}
