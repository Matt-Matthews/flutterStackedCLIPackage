import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:homescreen/model/todo.dart';
import 'package:homescreen/util/todo_db.dart';
import 'package:stacked/stacked.dart';
import 'package:hive/hive.dart';

class MapViewModel extends BaseViewModel {
  double _angle = 0;
  String _name = '';

  double get rotateAngle => _angle;
  String get name => _name;

  void updateRotateAngle() {
    // for(int i = 0; i <= 200; i++){

    //   _angle += 10;
    // }
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (kDebugMode) {
        print("time test😒😒${timer.tick.toString()} + $_angle");
      }
      _angle += 10;
      notifyListeners();
    });
//
  }
  set angle(double _number){

  _angle = _number;
  }

  late Future<List<Todo>?> _futureTodos;
  final todoDB = TodoDB();

  Future<void> getData(double num) async {
    _futureTodos = todoDB.fetchAll();
   _futureTodos.then((value) => {
    _name = value![0].title,
    notifyListeners()
   });
    // var box = await Hive.openBox('testBox');
    // var data = box.get('dave');
    // _name = data.name;
    // print('got dave ${data.friends}'); 
    // _angle = num;
    // Timer(const Duration(seconds: 5), () {
    // angle = num;
    // print('testing the numbers: $num and: $_angle');
    
    // });
  }

  void getDataFromMail(double number) {
    // angle = number;
    getData(number);
  }
}
