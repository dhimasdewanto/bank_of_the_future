import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/register/register_controller.dart';
import 'ios_date_time_container.dart';
import 'schedule_select_button.dart';

class ScheduleTimePicker extends StatelessWidget {
  const ScheduleTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inherit = RegisterInherited.of(context);
    final controller = inherit.controllerState;
    final schedule = inherit.scheduleVideoCall;
    final scheduleTime = schedule.time;
    final now = DateTime.now();
    final scheduleTimeDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      scheduleTime?.hour ?? now.hour,
      scheduleTime?.minute ?? now.minute,
    );

    return ScheduleSelectButton(
      title: "Time",
      value: scheduleTime == null
          ? "- Choose Time -"
          : "${scheduleTime.hour.toString().padLeft(2, '0')}:${scheduleTime.minute.toString().padLeft(2, '0')}",
      onPressed: () async {
        TimeOfDay? newTime;

        if (Platform.isIOS) {
          newTime = await showModalBottomSheet<TimeOfDay>(
            context: context,
            builder: (context) {
              TimeOfDay? tempPickedTime;

              return IOSDateTimeContainer(
                onDone: () {
                  Navigator.of(context).pop(tempPickedTime);
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
                pickerWidget: CupertinoDatePicker(
                  initialDateTime: scheduleTimeDateTime,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  onDateTimeChanged: (dateTime) {
                    tempPickedTime = TimeOfDay.fromDateTime(dateTime);
                  },
                ),
              );
            },
          );
        } else {
          newTime = await showTimePicker(
            context: context,
            initialTime: scheduleTime ?? TimeOfDay.now(),
          );
        }

        controller.scheduleVideoCall = controller.scheduleVideoCall.copyWith(
          time: newTime,
        );
      },
    );
  }
}
