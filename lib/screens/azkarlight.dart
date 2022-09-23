import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';


class azkarlight extends StatelessWidget {
  // Sora(item);



  Widget build(BuildContext context) {

    return BlocConsumer<appCubit, appStates>(
    listener: (context, state) {},
    builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('اذكار الصباح'),
              backgroundColor: Colors.brown,
        ),
        body:             SingleChildScrollView(
          child: Column(
            children: [
           /*   Container(
                      color: Colors.red,
                      child: MaterialButton(
                          onPressed: () {
                            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                         //   appCubit.get(context).readazkarJson();
                    print(appCubit.get(context).azkaritemslight.length);
                          }

                      )
                  ),*/


              ListView.separated(

                physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,




                itemBuilder: (context, index) =>
                    Item( appCubit.get(context).azkaritemslight[index],context),

                separatorBuilder: (context, index) => SizedBox(

                  height: 5,

                ),

                itemCount:appCubit.get(context).azkaritemslight.length ,

              ),


            ],
          ),
        ),
      ),
      );
    },
    );
  }
}


Item(item,context)=>
    Padding(

      padding: const EdgeInsets.all(10.0),

      child:   Container(

        height: 200,

        width: double.infinity,

        decoration: BoxDecoration(



          borderRadius: BorderRadius.circular(

            6

            ,

          ),

          color: Colors.brown,

        ),



        alignment: Alignment.center,

        child:             Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            text: TextSpan(
                text: item["content"],
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),






      ),

    );
