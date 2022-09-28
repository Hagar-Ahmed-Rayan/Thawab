



import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/screens/home.dart';
import 'package:thawab/screens/qblah.dart';
import 'package:thawab/screens/quran.dart';
import 'package:thawab/screens/setting.dart';
import 'package:thawab/screens/tasbih.dart';
import 'package:thawab/shared/sharedpreference.dart';
import 'package:thawab/shared/notifications.dart';

class curvednav extends StatefulWidget {
  const curvednav({Key? key}) : super(key: key);

  @override
  _curvednavState createState() => _curvednavState();
}

class _curvednavState extends State<curvednav> {

  late final LocalNotificationService service;

  @override
  void initState(){
    service = LocalNotificationService();
    service.intialize();
    super.initState();

  }
  Widget build(BuildContext context) {
   // appCubit.get(context).shownotification();
    return BlocConsumer<appCubit, appStates>(

      listener: (context, state) async{
/*if(state is !timegraterthanoneerror) {
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
  print("33333333333333333");
}*/


      },
      builder: (context, state) {
        var cubit=appCubit.get(context);

        return Scaffold(

          body: Center(
            child: cubit.screens[cubit.currentIndex],
          ),

          bottomNavigationBar: Material(
            elevation: 20,
            child: CurvedNavigationBar(

              color: Colors.brown,

              backgroundColor: Colors.brown.shade300,
           //  buttonBackgroundColor: Colors.white,
              items: <Widget>[

                Icon(Icons.edit_location, size: 30,
                  color: Colors.white,
                ),
         //     Image(image: AssetImage('assets/images/tasbih.jpg')),

               Icon(Icons.add_circle, size: 30,
                 color: Colors.white,

               ),
                Icon(Icons.home, size: 30,
                  color: Colors.white,

                ),
                Icon(Icons.settings, size: 30,
                  color: Colors.white,

                ),



              ],
              index: appCubit.get(context).currentIndex,
              height: 60.0,
            //  color: Colors.green,
             // buttonBackgroundColor: Colors.green,
            //  backgroundColor: Colors.white,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),

              letIndexChange: (index) => true,
              onTap: (index) {
                cubit.changeBottom(index);
              },
             // onTap: _onItemTapped,




            ),
          ),



        );
      },
    );
  }
}