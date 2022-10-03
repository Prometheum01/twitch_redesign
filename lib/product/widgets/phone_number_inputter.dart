import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kartal/kartal.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/product/const/string_data.dart';
import 'package:twitch_design/product/widgets/custom_text_field.dart';
import 'package:twitch_design/product/widgets/transparent_input_border.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({
    Key? key,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPaddings.smallVertical(),
          child: Text(
            StringData.phoneNumber,
            style: context.textTheme.bodySmall?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          decoration: TextFieldContainerDecoration(),
          child: Padding(
            padding: const ProjectPaddings.smallVertical(),
            child: InternationalPhoneNumberInput(
              onInputChanged: (phoneNumber) {},
              selectorTextStyle: context.textTheme.bodySmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textFieldController: phoneController,
              textStyle: context.textTheme.bodySmall,
              keyboardType: TextInputType.phone,
              inputDecoration: const TransparentInputBorder(),
              validator: (String? value) {
                if (value != null) {
                  if (value.trim().isEmpty) {
                    return 'Please write number';
                  }
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
