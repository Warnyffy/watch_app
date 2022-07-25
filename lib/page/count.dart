// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:watch1/round.dart';

class Countdown extends StatefulWidget {
  const Countdown({ Key? key }) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> with TickerProviderStateMixin{
  // defining controller in hours minutes and secs
  late AnimationController controller;
  bool isPlaying = false;
  String get countText {
    Duration count = controller.duration! * controller.value;
      return controller.isDismissed?
      '${(controller.duration!.inHours % 24)
      .toString().padLeft(2, '0')}:${(controller.duration!.inMinutes % 60)
      .toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60)
      .toString().padLeft(2, '0')}':
      '${(count.inHours % 24)
      .toString().padLeft(2, '0')}:${(count.inMinutes % 60)
      .toString().padLeft(2, '0')}:${(count.inSeconds % 60)
      .toString().padLeft(2, '0')}';
  }
  //progress and notification
  double progress = 1.0;

  void notify(){
    if (countText == '00:00:00') {
      FlutterRingtonePlayer.play(
         android: AndroidSounds.notification,
             ios: const IosSound(1023),
         looping: true,
          volume: 10,
      );
    }
      
    
  }
  @override
  void initState() {
    // controller manage
    super.initState();
    controller = AnimationController(vsync: this,
    duration: Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
         
        });
      }
    });
  }
  @override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }
  @override
  //this is the beginning of the countdown
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          Expanded(
            child:Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    value: progress,
                    strokeWidth: 6,
                  )),
                GestureDetector(
                  onTap: (){
                    if (controller.isDismissed) {
                      showModalBottomSheet(context: context, builder: (context)=>
                    SizedBox(
                      height: 300,
                      child: CupertinoTimerPicker(
                        initialTimerDuration: controller.duration!,
                          onTimerDurationChanged: (time){
                            setState(() {
                              controller.duration = time;
                            });
                             } ,),
                    ),);
                    }
                    
                            
                     
                  },
                  child: AnimatedBuilder(
                     animation: controller,
                     builder: (context, child )
                      => Text(countText,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    
                  ),
                ),
              ],
            ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                      GestureDetector(
                        onTap: (){
                          if (controller.isAnimating) {
                            controller.stop();
                            setState(() {
                              isPlaying = false;
                            });
                          }else{
                            controller.reverse(from: controller.value == 0 ? 1.0:
                          controller.value
                          
                          );
                          setState(() {
                            isPlaying = true;
                          });
                          }
                          
                        },
                  child: RoundButton(
                    icon:isPlaying == true ?   Icons.pause:    
                    Icons.play_arrow, 
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: RoundButton(
                    icon:Icons.stop,
                  ),
                ),
              ]
            ),
            ),
        ],
      ),
    );
  }
}