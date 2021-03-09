import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/register/register_controller.dart';
import 'schedule_select_button.dart';

class ScheduleDatePicker extends StatelessWidget {
  const ScheduleDatePicker({
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
    final inherit = RegisterInherited.of(context);
    final controller = inherit.controllerState;
    final schedule = inherit.scheduleVideoCall;
    final scheduleDate = schedule.date;

    final minDate = DateTime.now();
    final maxDate = DateTime.now().add(
      const Duration(days: 30),
    );

    return ScheduleSelectButton(
      title: "Date",
      value: scheduleDate == null
          ? "- Choose Date -"
          : "${_getDayName(scheduleDate.weekday)}, ${scheduleDate.day} ${_getMonthName(scheduleDate.month)} ${scheduleDate.year}",
      onPressed: () async {
        DateTime? newDate;

        if (Platform.isIOS) {
          newDate = await showModalBottomSheet<DateTime>(
            context: context,
            builder: (context) {
              DateTime? tempPickedDate;

              return Container(
                height: 250,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop(tempPickedDate);
                          },
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        initialDateTime: scheduleDate ?? DateTime.now(),
                        minimumDate: minDate,
                        maximumDate: maxDate,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime) {
                          tempPickedDate = dateTime;
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          newDate = await showDatePicker(
            context: context,
            initialDate: scheduleDate ?? DateTime.now(),
            firstDate: minDate,
            lastDate: maxDate,
          );
        }

        controller.scheduleVideoCall = controller.scheduleVideoCall.copyWith(
          date: newDate,
        );
      },
    );
  }
}
