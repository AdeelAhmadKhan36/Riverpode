
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/feature_provider.dart';


class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureprovider=ref.watch(feature_provider);
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text(" App",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),



      body: Center(
        child: futureprovider.when(
          skipLoadingOnRefresh: false,
              data: (value)=>Expanded(
                child: ListView.builder(

                  itemCount: value.length,
                    itemBuilder: (context, index){
                      return Text(value[index].toString());

                    }


                ),
              ),
            error: (error, stack)=>Text(error.toString()),
            loading:()=> CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         ref.invalidate(feature_provider);
      }),
    );
  }
}
