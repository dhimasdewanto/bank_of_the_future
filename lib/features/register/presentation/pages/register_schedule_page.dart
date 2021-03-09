import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../controllers/register/register_controller.dart';
import '../widgets/big_bottom_button.dart';
import '../widgets/schedule_select_button.dart';
import '../widgets/top_page_numbers.dart';

class RegisterSchedulePage extends StatelessWidget {
  const RegisterSchedulePage({
    Key? key,
  }) : super(key: key);

  String _getDayName(int weekDay) {
    if (weekDay == 1) {
      return "Senin";
    }
    if (weekDay == 2) {
      return "Selasa";
    }
    if (weekDay == 3) {
      return "Rabu";
    }
    if (weekDay == 4) {
      return "Kamis";
    }
    if (weekDay == 5) {
      return "Jumat";
    }
    if (weekDay == 6) {
      return "Sabtu";
    }
    if (weekDay == 7) {
      return "Minggu";
    }
    return "";
  }

  String _getMonthName(int month) {
    if (month == 1) {
      return "Januari";
    }
    if (month == 2) {
      return "Februari";
    }
    if (month == 3) {
      return "Maret";
    }
    if (month == 4) {
      return "April";
    }
    if (month == 5) {
      return "Mei";
    }
    if (month == 6) {
      return "Juni";
    }
    if (month == 7) {
      return "Juli";
    }
    if (month == 8) {
      return "Agustus";
    }
    if (month == 9) {
      return "September";
    }
    if (month == 10) {
      return "Oktober";
    }
    if (month == 11) {
      return "November";
    }
    if (month == 12) {
      return "Desember";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColor;
    final textColor = Theme.of(context).canvasColor;
    final headline6 = Theme.of(context).textTheme.headline6?.copyWith(
          color: textColor,
        );
    final bodyText1 = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: textColor,
        );
    final inherit = RegisterInherited.of(context);
    final controller = inherit.controllerState;
    final schedule = inherit.scheduleVideoCall;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(sizeL),
          child: Column(
            children: [
              const TopPageNumbers(
                index: 3,
              ),
              const SizedBox(height: sizeL),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Schedule Video Call",
                      style: headline6,
                    ),
                    const SizedBox(height: sizeL),
                    Text(
                      "Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time.",
                      style: bodyText1,
                    ),
                    const SizedBox(height: sizeL),
                    ScheduleSelectButton(
                      title: "Date",
                      value: schedule == null
                          ? "- Choose Date -"
                          : "${_getDayName(schedule.weekday)}, ${schedule.day} ${_getMonthName(schedule.month)} ${schedule.year}",
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: schedule ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ),
                        );
                        final dateTime = schedule ?? DateTime.now();
                        controller.scheduleVideoCall = DateTime(
                          date?.year ?? dateTime.year,
                          date?.month ?? dateTime.month,
                          date?.day ?? dateTime.day,
                          dateTime.hour,
                          dateTime.minute,
                        );
                      },
                    ),
                    const SizedBox(height: sizeM),
                    ScheduleSelectButton(
                      title: "Time",
                      value: schedule == null
                          ? "- Choose Time -"
                          : "${schedule.hour.toString().padLeft(2, '0')}:${schedule.minute.toString().padLeft(2, '0')}",
                      onPressed: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        final dateTime = schedule ?? DateTime.now();
                        controller.scheduleVideoCall = DateTime(
                          dateTime.year,
                          dateTime.month,
                          dateTime.day,
                          time?.hour ?? 0,
                          time?.minute ?? 0,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: sizeL),
              BigButtonBottom(
                onPressed: () => controller.processSchedule(context),
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
