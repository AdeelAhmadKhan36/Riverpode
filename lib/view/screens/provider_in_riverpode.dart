
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Use to read constant value
final hello=Provider<String>((ref){

  return "HomePage";

});

final age=Provider<int>((ref){

  return 23;
});
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val=ref.watch(hello);
    final myage=ref.watch(age);
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Home Screen",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Center the children in the column.
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                Text(val, style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,

                ),),
                Text(myage.toString(), style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,

                ),),
              ],
            ),
          ),
        ],
      ),


          );
  }
}

class HomePageTwo extends ConsumerStatefulWidget {
  const HomePageTwo({super.key});

  @override
  ConsumerState<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends ConsumerState<HomePageTwo> {
  @override
  Widget build(BuildContext context) {
    final val=ref.watch(hello);
    final myage=ref.watch(age);
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("",style: TextStyle(color:Colors.white,),)),
        backgroundColor: Colors.indigo,

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Center the children in the column.
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                Text(val, style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,

                ),),
                Text(myage.toString(), style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,

                ),),
              ],
            ),
          ),
        ],
      ),


    );
  }
}
