

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/slider_pro.dart';


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
         // final opaicty=ref.watch(Slider_provider);

          final slider=ref.watch(Slider_provider.select((state)=>state.showpassword));


         print("icons");
         return        InkWell(
           onTap: (){
             final statpro=  ref.read(Slider_provider.notifier);
             statpro.state=statpro.state.copywith(showpassword: !slider);
           },
           child: Container(
             height: 200,
             width: 200,
             child: slider?Icon(Icons.add):Icon(Icons.access_time_rounded),
           ),
         );

       }),

       Consumer(builder: (context, ref , child){
             // final opaicty=ref.watch(Slider_provider);

             final slider=ref.watch(Slider_provider.select((state)=>state.slider));


             print("Contaier");
             return        Container(
               height: 200,
               width: 200,
               color: Colors.red.withOpacity(slider),
             );

           }),

       Consumer(builder: (context, ref , child){
         // final slider=ref.watch(Slider_provider);
         final slider=ref.watch(Slider_provider.select((state)=>state.slider));



         print("Slider");

         return Slider(value: slider, onChanged: (value){
           final statpro=  ref.read(Slider_provider.notifier);
           statpro.state=statpro.state.copywith(slider: value);
         });

       }),

     ],
   ),
    );
  }
}
