import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:twitch_design/core/extensions/date_time_extension.dart';

import '../../core/const/paddings.dart';
import '../../features/sign_up_page/provider/sign_up_provider.dart';
import '../const/color_data.dart';
import '../const/string_data.dart';
import 'custom_text_field.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  void _showPicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime(
        DateTime.now().year - 13,
        DateTime.now().month,
        DateTime.now().day,
      ),
      onConfirm: (date) {
        context.read<SignUpProvider>().setDate(date);
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPaddings.smallVertical(),
          child: Text(
            StringData.dateOfBirth,
            style: context.textTheme.bodySmall?.copyWith(fontSize: 16),
          ),
        ),
        GestureDetector(
          onTap: () {
            _showPicker();
          },
          child: Container(
            decoration: TextFieldContainerDecoration(),
            child: Padding(
              padding: const ProjectPaddings.mediumAll(),
              child: Row(
                children: const [
                  Icon(Icons.date_range_outlined),
                  Padding(
                    padding: ProjectPaddings.customTextField(),
                    child: BirthdateText(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BirthdateText extends StatefulWidget {
  const BirthdateText({
    Key? key,
  }) : super(key: key);

  @override
  State<BirthdateText> createState() => _BirthdateTextState();
}

class _BirthdateTextState extends State<BirthdateText> {
  String getDateText() {
    return context.watch<SignUpProvider>().selectedDateTime.toStringDMY ??
        StringData.dateHint;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getDateText(),
      style: context.textTheme.bodySmall?.copyWith(color: ColorData.osloGrey),
    );
  }
}
