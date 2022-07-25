import 'package:flutter/cupertino.dart';
import 'package:watch1/page/Alarm_info.dart';

import 'enums.dart';
import 'menu_info.dart';

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)), description: 'Office'),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2)), description: 'Study'),
];
List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];