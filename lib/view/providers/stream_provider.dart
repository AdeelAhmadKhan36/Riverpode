


import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final socketPriceProvider=StreamProvider((ref)async*{

  final random=Random();
  double currentPrice=100.0;

  while(true){
    await Future.delayed(Duration(seconds: 2));
    currentPrice+=random.nextDouble()*4-2;
     throw 'Unexpected Error Occured';
       yield double.parse(currentPrice.toStringAsFixed(2));

  }

});