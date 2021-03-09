import 'package:flutter/material.dart';

import '../controllers/register/register_controller.dart';
import 'schedule_select_button.dart';

class ScheduleTimePicker extends StatelessWidget {
  const ScheduleTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inherit = RegisterInherited.of(context);
    final controller = inherit.controllerState;
    final schedule = inherit.scheduleVideoCall;
    final scheduleTime = schedule.time;

    return ScheduleSelectButton(
      title: "Time",
      value: scheduleTime == null
          ? "- Choose Time -"
          : "${scheduleTime.hour.toString().padLeft(2, '0')}:${scheduleTime.minute.toString().padLeft(2, '0')}",
      onPressed: () async {
        final newTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        controller.scheduleVideoCall = controller.scheduleVideoCall.copyWith(
          time: newTime,
        );
      },
    );
  }
}
