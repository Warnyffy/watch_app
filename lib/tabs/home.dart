// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:watch1/page/Alarm.dart';
import 'package:watch1/page/Timer.dart';
import 'package:watch1/page/count.dart';
import 'package:watch1/page/watch.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  int CurrentTab = 0;
  final List<Widget> screens = [
    Watch(),
    Timer(),
    Alarm(),
    Countdown(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Watch() ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text( 'AG WATCH'),),
      backgroundColor: Colors.black12,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      
     bottomNavigationBar: BottomAppBar(
       
     color: Colors.white,
       child: Container(
         height: 61,
         margin: EdgeInsets.all(3.0),
         child: Padding(
           padding: const EdgeInsets.only(left: 1,right: 2),
           child: Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Row(
                 crossAxisAlignment:CrossAxisAlignment.start ,
                 children: [
                   
                 MaterialButton(  
                   
                     onPressed:(){
                     setState(
                       (){
                       
                           currentScreen= Watch();
                            CurrentTab=0;
                          
                          
                       } );
                    },
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 15),
                         child: Icon(
                           Icons.access_time,
                           
                           color: CurrentTab == 0 ? Colors.pinkAccent: Colors.blueGrey,
                           size: 35.0,
                           
                      ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 12,),
                         child: Text('Watch',
                         style: TextStyle(
                           color: CurrentTab== 0 ? Colors.pinkAccent : Colors.blueGrey,
                           fontSize: 14
                          ),
                         ),
                       ),
                        
                     ],
                    ),
                ),
                    
                 MaterialButton(  
                     onPressed:(){
                     setState(
                       (){
                         currentScreen=Timer();
                         CurrentTab=1;
                          
                       });
                    },
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 7),
                         child: Icon(
                           Icons.timer,
                           color: CurrentTab == 1 ? Colors.pinkAccent: Colors.blueGrey,
                           size: 35.0,
                      ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 7),
                         child: Text('Timer',
                         style: TextStyle(
                           color: CurrentTab== 1 ? Colors.pinkAccent : Colors.blueGrey,
                           fontSize:14
                           
                          ),
                         ),
                       ),
                        
                     ],
                    ),
                ),
                    MaterialButton(  
                     onPressed:(){
                     setState(
                       (){
                         currentScreen=Countdown();
                         CurrentTab=2;
                          
                       });
                    },
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 2),
                         child: Icon(
                           Icons.hourglass_top,
                           color: CurrentTab == 2 ? Colors.pinkAccent : Colors.blueGrey,
                           size: 35.0,
                      ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 2),
                         child: Text('Countdown',
                         style: TextStyle(
                           color: CurrentTab== 2 ? Colors.pinkAccent : Colors.blueGrey,
                           fontSize: 14
                          ),
                         ),
                       ),

                     ],
                    ),
                ),
                   MaterialButton(  
                     onPressed:(){
                     setState(
                       (){
                         currentScreen=Alarm();
                         CurrentTab=3;
                          
                       });
                    },
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 0),
                             child: Icon(
                         Icons.alarm,
                         color: CurrentTab == 3 ? Colors.pinkAccent : Colors.blueGrey,
                         size: 35.0,
                      ),
                           ),
                       
                       Padding(
                         padding: const EdgeInsets.only(left: 0),
                         child: Text('Alarm',
                         style: TextStyle(
                           color: CurrentTab== 3 ? Colors.pinkAccent : Colors.blueGrey,
                           fontSize: 14
                          ),
                         ),
                       ),

                     ],
                    ),
                ),
                 ],
               ),
             ],
            ),
         ),
        ) ,
       ),
    );
  }
}