
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

//import 'package:geocoder/geocoder.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/screens/home.dart';
import 'package:thawab/screens/qblah.dart';
import 'package:thawab/screens/quran.dart';
import 'package:thawab/screens/setting.dart';
import 'package:thawab/screens/tasbih.dart';
import 'package:thawab/shared/cachehelper.dart';
import 'package:thawab/shared/notifications.dart';


class appCubit extends Cubit<appStates> {
  appCubit() : super(appInitialState());

  static appCubit get(context) => BlocProvider.of(context);
//late String sucessmess;

  int? len;
  bool isDark= CacheHelper.getData(key: 'mood') ;

 // bool isDark=true;
  var isnotfi=false;
void changemood(){



  isDark=!isDark;
  print(isDark);
  CacheHelper.saveData(key: "mood", value: isDark);

  print("changemoodstateeeeeeeeeeeeeeee");

  emit(changemoodstate());

}
 void changeisnotfi(){
    isnotfi=!isnotfi;
    print(isnotfi);
    print("changnotfistateeeeeeeeeeeeeeee");

    emit(changenotificationstate());

  }

  int currentIndex = 2;
  PageController pageController=PageController(initialPage: 2);


  void changeBottom(int index) {
    currentIndex = index;
    if(index==3)
    {

    }
    if(index==2)
    {
      readJson();
      shownotification();
    }
    if(index==4)
    {

      shownotification();
    }
    if(index==0)
    {
      shownotification();


    }

    emit(AppChangeBottomNavState());
  }

  List<Widget> screens = [
    qblah(),
    Tasbih(),
    home(),
    setting(),


  ];


  List items=[] ;
  List azkaritems=[] ;
  List azkaritemslight=[] ;
  List azkaritemsnight=[] ;
  List azkartypes=[
    'أذكار الصباح',
    'أذكار المساء',
  ] ;




  Future<void> readJson() async {
    emit(readjsonLoding());
    await rootBundle.loadString( "assets/localdb/quran.json")
        .then((value) async{
      final String response=value;
      print("vvvvvvvvvvvvvvvvvvvvvvvv");
      print(value);
      final data = await json.decode(response);
      items = data["chapters"];
      print("doneeeeeeeeeeeeee");
      print(items);

      print(value);
      emit(readjsonSuccessful());

    }).catchError((error)

        {

          print("zffffffffffffffffffffffffffffffffffffffffffftjson");
          print(error);








          emit(readjesonErrorState(error()));
        });

  }
  late final LocalNotificationService service;

 /* void show(context) async{
    if (appCubit.get(context).shownotification()) {
      await service.showNotification(
          id: 0,
          title: 'Thawap',
          body: 'سبحان الله');
      CacheHelper.saveData(key: "lastnotfi", value: DateTime.now().toString());
    }

  }*/
  late int diff;

  Future<void> readazkarJson() async {
    emit(readazkarjsonLoding());
    await rootBundle.loadString( "assets/localdb/azkardb.json")
        .then((value) async{
      final String response=value;
      print("vvvvvvvvvvvvvvvvvvvvvvvv");
      print(value);
      final data = await json.decode(response);
      azkaritems = data["azkar"];
      for(int i=0;i<azkaritems.length;i++) {
        if (azkaritems[i]['name'] == 'أذكار الصباح') {
          print('yesssssssssssss');
          azkaritemslight.add(azkaritems[i]);
        }
        else if (azkaritems[i]['name'] == 'أذكار المساء')
          azkaritemsnight.add(azkaritems[i]);
      }

      print("doneeeeeeeeeeeeee");
      print(items);

      print(value);
      emit(readazkarjsonSuccessful());

    }).catchError((error)

    {

      print("zffffffffffffffffffffffffffffffffffffffffffftjson");
      print(error);








      emit(readazkarjesonErrorState(error()));
    });

  }
  bool shownotification() {

    String value = CacheHelper.getData(key: 'lastnotfi');
    if (value == ''||value==null) {
      print('yesssssssss time');
      emit(timegraterthanone());

      return true;

    } else {
      DateTime lastQuiz = DateTime.parse(value);
      if ((lastQuiz.difference(DateTime.now()).inMinutes.abs()) >= 1) {
        print('yesssssssss time>1' );
        emit(timegraterthanone());

 return true;
      }
      else{
        print("noooooooooooooooo");
  diff=lastQuiz.difference(DateTime.now()).inMinutes.abs();
        print(diff );
        emit(timegraterthanoneerror());


        return false;
//print(lastQuiz.difference(DateTime.now()).inMinutes );
       // print("noooooooooooooooo");
      }
    }
  }



}











