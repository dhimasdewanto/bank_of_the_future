import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../controllers/register/register_controller.dart';
import '../widgets/big_bottom_button.dart';
import '../widgets/top_page_numbers.dart';

class RegisterEmailPage extends StatelessWidget {
  const RegisterEmailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inherit = RegisterInherited.of(context);
    final state = inherit.state;
    final controller = inherit.controllerState;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final thickHeadline4 = textTheme.headline4?.copyWith(
      color: textTheme.bodyText1?.color,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(sizeL),
          child: Column(
            children: [
              const TopPageNumbers(
                index: 0,
              ),
              const SizedBox(height: sizeL),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to \nGIN ",
                        style: thickHeadline4,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Finans",
                            style: textTheme.headline4?.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: sizeL),
                    Text(
                      "Welcome to the Bank of Future. Manage and track your accounts on the go.",
                      style: textTheme.bodyText1,
                    ),
                    const SizedBox(height: sizeL),
                    TextField(
                      controller: state.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        labelText: "Email",
                      ),
                    ),
                  ],
                ),
              ),
              BigButtonBottom(
                onPressed: () => controller.processEmail(context),
                showLoadingIndicator: inherit.isLoading,
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
