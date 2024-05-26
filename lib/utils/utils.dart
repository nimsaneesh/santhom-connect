// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/utils/image_constant.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

getImage(relationshipName) {
  print("relationshipName :" + relationshipName ?? "no image");
  var image = "null";
  if (relationshipName == null) {
    image = ImageConstant.imageNotFound;
  } else if (relationshipName == "Son") {
    image = ImageConstant.son;
  } else if (relationshipName == "Daughter") {
    image = ImageConstant.daughter;
  } else if (relationshipName == "Wife") {
    image = ImageConstant.daughter_in_law;
  } else if (relationshipName == "Head of family") {
    image = ImageConstant.family_head;
  } else if (relationshipName == "Grandson") {
    image = ImageConstant.grand_son;
  } else if (relationshipName == "Granddaughter") {
    image = ImageConstant.daughter;
  } else if (relationshipName == "Daughter-in-law") {
    image = ImageConstant.daughter_in_law;
  } else if (relationshipName == "Daily Schedules") {
    image = ImageConstant.daily_schedule;
  } else if (relationshipName == "Events") {
    image = ImageConstant.events;
  } else if (relationshipName == "Birthdays") {
    image = ImageConstant.birthday;
  } else if (relationshipName == "Obituary") {
    image = ImageConstant.obituary;
  }else{
    image = ImageConstant.imageNotFound;
  }
  print("relationshipName :" + relationshipName);
  return image;
}

getColor(category) {
  var color = Color(0XFF699DC5);
  if (category == "News & Announcements") {
    color = Color(0XFF00B383);
  } else if (category == "Events") {
    color = Color(0XFFFF9310);
  } else if (category == "Downloads") {
    color = Color(0XFF6D29F6);
  } else if (category == "Vicar Messages") {
    color = Color.fromARGB(255, 56, 147, 136);
  } else if (category == "Notifications") {
    color = Color.fromARGB(255, 134, 163, 71);
  }
  return color;
}

void shareToWhatsApp(String message, String url) {
  Share.share('$message\n$url', subject: 'Shared from Santomconnect');
}
