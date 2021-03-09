import 'package:flutter/material.dart';

class ScheduleDateTime {
  ScheduleDateTime({
    this.date,
    this.time,
  });

  final DateTime? date;
  final TimeOfDay? time;

  ScheduleDateTime copyWith({
    DateTime? date,
    TimeOfDay? time,
  }) {
    return ScheduleDateTime(
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ScheduleDateTime && o.date == date && o.time == time;
  }

  @override
  int get hashCode => date.hashCode ^ time.hashCode;
}
