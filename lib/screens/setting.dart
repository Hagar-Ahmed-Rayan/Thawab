import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/shared/cachehelper.dart';

bool statusmood=false;
bool statusnotfi=false;

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _TasbihState();
}

class _TasbihState extends State<setting> {
  int count = 0;
  Icon repeat = Icon(Icons.repeat, );
  @override
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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Setting',
          ),
          backgroundColor: Colors.brown,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Dark Mood',
                    style: TextStyle(
                 //     color: Colors.green
                    ),

                  ),
                  Spacer(),
                  Container(
                    child: FlutterSwitch(
                      activeTextColor:Colors.white ,
                      inactiveTextColor: Colors.white,
                    //  toggleColor: Colors.white, the ball

                      activeColor: Colors.brown,
                      inactiveColor: Colors.grey,

                      width: 125.0,
                      height: 55.0,
                      valueFontSize: 25.0,
                      toggleSize: 45.0,
                      value: (CacheHelper.getData(key: 'mood')==true)?true:false,
                      borderRadius: 30.0,
                      padding: 8.0,


                      showOnOff:  (CacheHelper.getData(key: 'mood')==true)?true:false,
                      onToggle: (val) {
                        appCubit.get(context).changemood();

                      //  setState(() {
                          statusmood = val;
                          print(appCubit.get(context).isDark);

                          print(val);
                    //   });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
         /*     Row(
                children: [
                  Text('Notification'),
                  Spacer(),

                  Container(
                    child: FlutterSwitch(
                      toggleColor: Colors.white,
                      activeColor: Colors.brown,
                      width: 125.0,
                      height: 55.0,
                      valueFontSize: 25.0,
                      toggleSize: 45.0,
                      value: statusnotfi,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          statusnotfi = val;
                         appCubit.get(context).changeisnotfi();


                        });
                      },
                    ),
                  ),
                ],
              )*/


            ],
          ),
        ),
      ),
    );
  },
  );
}
}