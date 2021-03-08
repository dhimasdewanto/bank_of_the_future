import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../widgets/big_bottom_button.dart';
import '../widgets/password_status_widget.dart';
import '../widgets/top_page_numbers.dart';

class RegisterPasswordPage extends StatelessWidget {
  const RegisterPasswordPage({
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(sizeL),
          child: Column(
            children: [
              const TopPageNumbers(
                index: 1,
              ),
              const SizedBox(height: sizeL),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Password",
                      style: headline6,
                    ),
                    const SizedBox(height: sizeL),
                    Text(
                      "Password will be used to login to account",
                      style: bodyText1,
                    ),
                    const SizedBox(height: sizeL),
                    Container(
                      decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: borderRadius,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: sizeM,
                        vertical: sizeS,
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                        onEditingComplete: () {},
                      ),
                    ),
                    const SizedBox(height: sizeM),
                    Row(
                      children: [
                        Text(
                          "Complexity: ",
                          style: bodyText1,
                        ),
                        Text(
                          "Very Weak",
                          style: bodyText1?.copyWith(
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: sizeL),
                    const PasswordStatusWidget(),
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
