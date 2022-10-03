import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/features/sign_up_page/view_model/sign_up_page_view_model.dart';
import 'package:twitch_design/product/const/color_data.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/widgets/custom_text_field.dart';
import 'package:twitch_design/product/widgets/general_button.dart';
import 'package:twitch_design/product/widgets/phone_number_inputter.dart';
import 'package:twitch_design/product/widgets/title_with_sub.dart';

import '../../../product/widgets/date_time_picker.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends SignUpPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const ProjectPaddings.largeAll(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithSub(
                    title: StringData.signUp,
                    subtitle: StringData.createAccount),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      PhoneNumberInput(phoneController: phoneController),
                      Padding(
                        padding: const ProjectPaddings.mediumVertical(),
                        child: TextFieldWithLabel(
                          label: Text(
                            StringData.email,
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontSize: 16),
                          ),
                          controller: emailController,
                          textStyle: context.textTheme.bodySmall,
                          validator: (value) {
                            if (!value.isValidEmail) {
                              return StringData.pleaseWriteEmail;
                            }

                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFieldWithLabel(
                            controller: passwordController,
                            label: Text(
                              StringData.password,
                              style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            validator: ((value) {
                              if (!value.isValidPassword) {
                                return StringData.writeStrongPassword;
                              }
                              return null;
                            }),
                            icon: const Icon(Icons.password_outlined,
                                color: Colors.black),
                            suffix: IconButton(
                              onPressed: () {
                                changeVisibility();
                              },
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.black,
                              ),
                            ),
                            isSecure: !isVisible,
                            textStyle: context.textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                            ),
                            onChanged: (String value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: ProjectPaddings.mediumVertical(),
                  child: DateTimePicker(),
                ),
                const _TermsText(),
                Padding(
                  padding: const ProjectPaddings.mediumVertical(),
                  child: GeneralButton(
                    text: const Text(StringData.signUp),
                    backgroundColor: ColorData.purplishBlue,
                    onPressed: () {
                      checkValidator();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _PasswordStage extends StatelessWidget {
  const _PasswordStage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const ProjectPaddings.smallHorizontal(),
          child: Text(
            'Strong',
            style: context.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF63ff2c),
              fontSize: 13,
            ),
          ),
        ),
        Container(
          width: context.dynamicWidth(0.25),
          height: context.dynamicHeight(0.0125),
          color: ColorData.lightLavender,
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              duration: context.durationNormal,
              width: context.dynamicWidth(0.2),
              height: context.dynamicHeight(0.0125),
              color: ColorData.purplishBlue,
            ),
          ),
        ),
      ],
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: StringData.termsFirstText,
        style: context.textTheme.bodySmall?.copyWith(fontSize: 16),
        children: [
          TextSpan(
            text: StringData.termsSecondText,
            style: context.textTheme.bodySmall
                ?.copyWith(fontSize: 16, color: ColorData.purplishBlue),
            children: [
              TextSpan(
                text: StringData.termsThirdText,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: StringData.termsFourthText,
                    style: context.textTheme.bodySmall
                        ?.copyWith(fontSize: 16, color: ColorData.purplishBlue),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
