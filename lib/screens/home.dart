import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:thawab/screens/sounds.dart';
import 'package:thawab/shared/sharedpreference.dart';
import 'package:thawab/shared/components.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/screens/azkar.dart';
import 'package:thawab/screens/azkarlight.dart';
import 'package:thawab/screens/navbar.dart';
import 'package:thawab/screens/quran.dart';
import 'package:thawab/screens/tasbih.dart';
import 'package:thawab/shared/notifications.dart';
import 'package:timezone/timezone.dart';
import 'package:rxdart/rxdart.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override


  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late final LocalNotificationService service;

  @override
  void initState(){
    service = LocalNotificationService();
    service.intialize();
    super.initState();

  }
  Widget build(BuildContext context) {


    return BlocConsumer<appCubit, appStates>(
    listener: (context, state) async {
    /*  if(state is timegraterthanoneerror) {
        print("uuuuuuuuuuuuuuu");

        await service.showNotification(
            id: 0,
            title: 'Thawap',
            body: 'سبحان الله');
        CacheHelper.saveData(
            key: "lastnotfi", value: DateTime.now()
            .toString());

      }
      else{
        print("eeeeeeeeeeeeeee");


      }*/

    },
    builder: (context, state) {
    return SafeArea(
      child: Scaffold(
appBar: null,
        body: Column(
          children: [
        //    if (appCubit.get(context).shownotification())

         /* Container(
                      color: Colors.red,
                      child: MaterialButton(
                          onPressed: () async {
                            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                        //    appCubit.get(context).show(context);
                           if (appCubit.get(context).shownotification()) {
                              await service.showNotification(
                                  id: 0,
                                  title: 'Thawap',
                                  body: 'سبحان الله');
                              CacheHelper.saveData(
                                  key: "lastnotfi", value: DateTime.now()
                                  .toString());
                            }
                            else(){
                              print("in else section");
                              print(appCubit.get(context).diff);
                            };

                          }
                      )
                  ),*/

            Stack(
              children: [
                Container(
                    height: 200,
                    width: double.infinity,
                    child:Image.asset(
                      "assets/images/b1.jpg",
                      fit: BoxFit.cover,
                    ),
        ),
                   Center(
                        child: StreamBuilder(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 35.0),
                                child: Text(
                                  "       ${DateFormat('hh:mm:ss').format(DateTime.now())}\n"
                                      "${DateFormat.yMMMMd('en_US').format(DateTime.now())}\n",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    wordSpacing:0.1


                                  ),
                                ),
                              );
                            })),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView(
                    children: [

                      CustomCard(
                        pageTitle: 'قران كريم',
                        imageLocation: 'assets/images/sm.jpg',
                        context:context,
                         page:quran(),
                      ),
                      CustomCard(
                        pageTitle: 'الاذكار',
                        imageLocation: 'assets/images/d.jpg',
                        context:context,
                        page:azkar(),
                      ),

                      CustomCard(
                        pageTitle: 'القراءن MP3',
                        imageLocation: 'assets/images/s.jpg',
                         context:context,
                     page:sounds(),
                      ),
                    /*  CustomCard(
                        pageTitle: 'التسبيح',
                        imageLocation: 'assets/images/d.jpg',
                        context:context,
                        page:Tasbih(),
                      ),*/

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    },
    );
  }
}