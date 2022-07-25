// ignore_for_file: file_names

import 'package:watch1/page/Alarm.dart';

class AlarmInfo {
  late DateTime alarmDateTime;
  late String description;
  late bool isActive;

  AlarmInfo (DateTime alarmDateTime, {required this.description}) : alarmDateTime = alarmDateTime;
}