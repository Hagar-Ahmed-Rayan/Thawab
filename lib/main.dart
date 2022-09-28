import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/screens/navbar.dart';
import 'package:thawab/shared/sharedpreference.dart';
import 'package:thawab/shared/notifications.dart';
late final LocalNotificationService service;

 void show(context) async{
    //if (appCubit.get(context).shownotification()) {
   List azkarnotifiction=[
     'سبحان الله',
     'الحمد لله',
     'لا الة لا الله ',
     'الله اكبر ',
     'لا حول ولا قوة الا بالله ',
     'صلي علي النبي',


   ] ;
   Random random = new Random();
   int randomNumber = random.nextInt(6);
      await service.showNotification(
          id: 0,
          title: 'Thawap',
          body: azkarnotifiction[randomNumber],
      );
      CacheHelper.saveData(key: "lastnotfi", value: DateTime.now().toString());


  }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
print("in main");
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
Timer? timer;



class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    service = LocalNotificationService();
    service.intialize();
    super.initState();
//  if  (appCubit.get(context). isnotfi)
   timer = Timer.periodic(Duration(seconds: 40), (Timer t) => show(context));



  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => appCubit()..readJson()..readazkarJson()..shownotification()


        ),

      ],
      child: BlocConsumer<appCubit, appStates>(
        listener: (context, state) {
          print(state);
          print("thisssssssssssss is statttttttttttte");

          if(state is changemoodstate){

            print("tttttttttttttttttttttttttttttttttt");
          }
          else
            print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");

        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
           /*   buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.accent,
                colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white), // Text color
                buttonColor: Colors.deepPurple,     //  <-- dark color
              ),*/
              primarySwatch: Colors.brown,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.brown,
              ),

              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.brown,
                unselectedItemColor: Colors.white,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),

              textTheme: TextTheme(

 /*button: TextStyle(
   fontSize: 18.0,

   decorationColor: Colors.blue,
   backgroundColor: Colors.red,
   fontWeight: FontWeight.w600,
   color: Colors.green,
 ),*/
                bodyText2: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor:Colors.black,
              //HexColor('333739'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Colors.black,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),

              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.black,
              ),
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
        //    themeMode:  ThemeMode.dark ,
          //    CacheHelper.getData(key: 'mood')

            themeMode: CacheHelper.getData(key: 'mood') ? ThemeMode.dark : ThemeMode.light,
            home: curvednav(),

            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
