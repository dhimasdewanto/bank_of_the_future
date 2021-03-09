import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../controllers/register/register_controller.dart';
import '../widgets/big_bottom_button.dart';
import '../widgets/information_dropdown.dart';
import '../widgets/top_page_numbers.dart';

class RegisterPersonalPage extends StatelessWidget {
  const RegisterPersonalPage({
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
                index: 2,
              ),
              const SizedBox(height: sizeL),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Information",
                      style: headline6,
                    ),
                    const SizedBox(height: sizeL),
                    Text(
                      "Please fill in the information below and your goal for digital saving.",
                      style: bodyText1,
                    ),
                    const SizedBox(height: sizeL),
                    InformationDropdown(
                      helperText: "Goal for activation",
                      initialValue: inherit.personalInformation.goalActivation,
                      listItems: inherit.personalInformation.listGoalActivation,
                      onSelected: (value) {
                        controller.personalInformation =
                            controller.personalInformation.copyWith(
                          goalActivation: value,
                        );
                      },
                    ),
                    const SizedBox(height: sizeL),
                    InformationDropdown(
                      helperText: "Monthly income",
                      initialValue: inherit.personalInformation.monthlyIncome,
                      listItems: inherit.personalInformation.listMonthlyIncome,
                      onSelected: (value) {
                        controller.personalInformation =
                            controller.personalInformation.copyWith(
                          monthlyIncome: value,
                        );
                      },
                    ),
                    const SizedBox(height: sizeL),
                    InformationDropdown(
                      helperText: "Monthly expense",
                      initialValue: inherit.personalInformation.monthlyExpense,
                      listItems: inherit.personalInformation.listMonthlyExpense,
                      onSelected: (value) {
                        controller.personalInformation =
                            controller.personalInformation.copyWith(
                          monthlyExpense: value,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: sizeL),
              BigButtonBottom(
                onPressed: () => controller.processPersonalInformation(context),
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
