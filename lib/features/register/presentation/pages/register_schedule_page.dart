import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../controllers/register/register_controller.dart';
import '../widgets/big_bottom_button.dart';
import '../widgets/icon_animation.dart';
import '../widgets/schedule_date_picker.dart';
import '../widgets/schedule_time_picker.dart';
import '../widgets/top_page_numbers.dart';

class RegisterSchedulePage extends StatelessWidget {
  const RegisterSchedulePage({
    Key? key,
  }) : super(key: key);

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
                    const IconAnimation(),
                    const SizedBox(height: sizeL),
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
                    const ScheduleDatePicker(),
                    const SizedBox(height: sizeM),
                    const ScheduleTimePicker(),
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
