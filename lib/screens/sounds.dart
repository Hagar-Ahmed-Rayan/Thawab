import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:thawab/cubit/cubit.dart';
import 'package:thawab/cubit/states.dart';
import 'package:thawab/shared/sharedpreference.dart';

class sounds extends StatefulWidget {
  const sounds({Key? key}) : super(key: key);

  @override
  State<sounds> createState() => _TasbihState();
}

class _TasbihState extends State<sounds> {

  final audioPlayer = AudioPlayer();
  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero ;
  @override

  void initState() {
    super.initState();
setAudio();
    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged. listen((state) { //it is turned or not
      setState(() {
        isplaying = state == PlayerState.playing;
      });
    });


    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
        });
    });
    /// Listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
        });
    });
    }
   Future setAudio()async{
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    String url='https://server8.mp3quran.net/ahmad_huth/001.mp3';
    await audioPlayer.setSourceUrl(url);
   }

  @override

  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit, appStates>(
      listener: (context, state) async {

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('sound',
              ),
              backgroundColor: Colors.brown,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            /*  ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
              'https://images.unsplash.com/photo-1541182388496',
              width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),*/
              const SizedBox(height: 32),
              const Text(
                  'سورة الفاتحة',
              style: TextStyle(
              fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ), // TextStyle
              ), // Text
          const SizedBox(height: 4),
          const Text(
              'الشيخ احمد الحذيفي',
              style: TextStyle(fontSize: 20),
              ), // Text
                  Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {

                        final position=Duration(seconds: value.toInt());
                        await audioPlayer.seek(position);
                        await audioPlayer.resume();

                      },
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(position.toString()),
                        Text((duration-position).toString()),
                      ],
                    ), // Row
                  ), // Padding
            CircleAvatar(
                radius: 35,
                child: IconButton(
                    icon: Icon(
                        isplaying ? Icons.pause: Icons.play_arrow,
                        ), // Icon
                    iconSize: 50,
                    onPressed: () async {
                      if (isplaying) {
                        await audioPlayer.pause();
                      }
                      else {
                        late Source audioUrl;
                        String url='https://server8.mp3quran.net/ahmad_huth/001.mp3';

                        audioUrl=UrlSource('https://server8.mp3quran.net/ahmad_huth/001.mp3');
                        await audioPlayer.play(audioUrl);
                      }

                    },
                ), // IconButton
                ), // CircleAvatar
// Column
            ],
              ), // Column
              ),
            ),

        );
      },
    );
  }
}