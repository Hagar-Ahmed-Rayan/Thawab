import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:thawab/shared/components.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/screens/navbar.dart';
import 'package:thawab/screens/sora.dart';

class quran extends StatelessWidget {
  const quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

appCubit.get(context).readJson();
var items=appCubit.get(context).items;

    return BlocConsumer<appCubit, appStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 10,
 title: Text('القراءن الكريم',
   style: TextStyle(
     color: Colors.brown,
         fontWeight: FontWeight.bold,
       fontSize: 20,
   ),
 ),
          //    backgroundColor: Colors.white,

            ),
            body:
            SingleChildScrollView(
              child: Column(
                children: [
                 /*Container(
                      color: Colors.red,
                      child: MaterialButton(
                          onPressed: () {
                            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                    print(items[0]['name']);
                          }

                      )
                  ),*/


          ListView.separated(

                      physics: NeverScrollableScrollPhysics(),

                     shrinkWrap: true,




                      itemBuilder: (context, index) =>
                          Item( appCubit.get(context).items[index],context),

                      separatorBuilder: (context, index) => SizedBox(

                        height: 10,

                      ),

                      itemCount:appCubit.get(context).items.length ,

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
GestureDetector(
  onTap: (){
navto(context, Sora(item:item));
  },
  child:   Padding(

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

    child: Text(

    //items[id]["name"],

      //'ggg',

        item['name'],

    style:

    TextStyle(

        fontSize: 45,

        color:Colors.white,

        fontWeight:FontWeight.bold ),

    ),



    ),

  ),
);
