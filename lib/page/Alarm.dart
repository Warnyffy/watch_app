// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:watch1/data.dart';

import '../main.dart';

class Alarm extends StatefulWidget {
  const Alarm({ Key? key }) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // beginning of the container
      child: Column(
      children: <Widget>[
        // here is to display the list and its items
        Expanded(
          child: ListView(
            children: alarms.map<Widget>((alarm){
              
              return Container(
                margin: const EdgeInsets.only(bottom: 19),
                padding: 
                const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                // decorating with gradient colors and the rest
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ Colors.white24,Colors.white70,],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  ),
                  boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius:8,
                        spreadRadius: 4,
                        offset: Offset(8, 8)
                      )
                  ],
                  // to cave the edges
                  borderRadius:BorderRadius.all(Radius.circular(18)),
                ),
                child: Column(
                  // alignment right
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget> [
                        Row(
                          children:<Widget> [
                            Icon(Icons.label,
                             color: Colors.pink,
                             size: 24,
                            ),
                             SizedBox(width: 8,),
                        Text('Offi', style: TextStyle(
                          color: Colors.pink, fontFamily: 'avenir'
                        ),
                        ),
                          ],
                        ),
                       
                        Switch(
                        onChanged: (bool value){},
                        value: true,
                        activeColor: Colors.pinkAccent,
                        ),
                      ],
                    ),
                   Text('MON-FRI', style: TextStyle(
                          color: Colors.pink, fontFamily: 'avenir',
                          fontSize: 18
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget> [
                            Text(
                              '04:00 AM', style: TextStyle(
                              color: Colors.pink, fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              fontSize: 24
                            ),
                            ),
                            Icon(Icons.keyboard_arrow_down,
                            size: 17,
                            color:  Colors.pinkAccent,
                            )
                          ],
                        ),
                  
                  ],
                ),
              );
            }).followedBy([
              if (alarms.length < 5)
              // for the dotted borders
              DottedBorder(
                strokeWidth: 2,
                color: Colors.pinkAccent.shade100,
                borderType: BorderType.RRect,
                radius: Radius.circular(24),
                dashPattern: [5,4],
                child: Container(
                  width: double.infinity,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  
                  
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: (){
                      // ignore: avoid_print
                      print('wake up');
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add_alarm,
                        size: 50
                        ),
                        SizedBox(height: 8,),
                        Text('Add Alarm',
                         style:TextStyle(color:Colors.pinkAccent,
                         fontFamily: 'avenir',
                         fontSize: 18
                         )
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else 
            Text('Only 5')
            ]).toList(),
          ),
        ),
      ],
    ),
    );
  }
  
 
}