import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../widgets/big_bottom_button.dart';
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
                  ],
                ),
              ),
              const SizedBox(height: sizeL),
              BigButtonBottom(
                onPressed: () {},
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
