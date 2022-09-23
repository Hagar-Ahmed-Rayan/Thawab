import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCard extends StatelessWidget {

  CustomCard({
    required this.context,
    required this.page,

    this.nav = true,
    this.height = 200,
    this.width = double.infinity,
    required this.imageLocation,
    this.fSize = 40,
    required this.pageTitle,
  });
  BuildContext context;
Widget page;

  String imageLocation;
  double height;
  double width;
  double fSize;
  String pageTitle;
  bool nav;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navto(context,page);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 20,
              offset: Offset(10, 10),
            ),
          ]),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown,
                  image: DecorationImage(

                      image: AssetImage(imageLocation) as ImageProvider,
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fSize,
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 5.0),
                            blurRadius: 8,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(0.0, 5.0),
                            blurRadius: 10,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(0.0, 10.0),
                            blurRadius: 15,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void navto(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = SizedBox(height: 32);
    final errorColor = Color(0xffb00020);

    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.location_off,
              size: 150,
              color: errorColor,
            ),
            box,
            Text(
              error!,
              style: TextStyle(color: errorColor, fontWeight: FontWeight.bold),
            ),
            box,
            RaisedButton(
              color: Colors.brown,
              child: Text("Retry"),
              onPressed: () {
                if (callback != null) callback!();
              },
            )
          ],
        ),
      ),
    );
  }
}

