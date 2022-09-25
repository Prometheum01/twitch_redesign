import 'package:flutter/material.dart';
import 'package:twitch_design/core/const/borders.dart';
import 'package:twitch_design/core/const/paddings.dart';
import 'package:twitch_design/product/const/color_data.dart';

class TextFieldWithLabel extends Column {
  TextFieldWithLabel({
    Key? key,
    required Text label,
    required TextEditingController controller,
    Widget? icon,
    bool isSecure = false,
    Widget? suffix,
    required textStyle,
    required String? Function(String? value) validator,
    required void Function(String value) onChanged,
  }) : super(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const ProjectPaddings.smallVertical(),
              child: label,
            ),
            Container(
              width: double.infinity,
              decoration: TextFieldContainerDecoration(),
              child: Padding(
                padding: const ProjectPaddings.customTextField(),
                child: CustomTextFormField(
                  controller: controller,
                  icon: icon,
                  isSecure: isSecure,
                  suffix: suffix,
                  validator: (value) {
                    return validator(value);
                  },
                  style: textStyle,
                  listener: (String value) {
                    onChanged.call(value);
                  },
                ),
              ),
            ),
          ],
        );
}

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    Key? key,
    required TextEditingController controller,
    required Widget? icon,
    required TextStyle? style,
    required void Function(String value) listener,
    required String? Function(String? value) validator,
    bool isSecure = false,
    Widget? suffix,
  }) : super(
          key: key,
          style: style,
          controller: controller,
          onChanged: (String value) {
            listener.call(value);
          },
          validator: (String? value) {
            return validator(value);
          },
          obscureText: isSecure,
          autocorrect: !isSecure,
          enableSuggestions: !isSecure,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              icon: icon, border: InputBorder.none, suffixIcon: suffix),
        );
}

class TextFieldContainerDecoration extends BoxDecoration {
  TextFieldContainerDecoration({Color backgroundColor = ColorData.desertStorm})
      : super(
          borderRadius: const ProjectBorders.smallAll(),
          color: backgroundColor,
          boxShadow: [
            const BoxShadow(
                color: ColorData.boxShadowColor,
                offset: Offset(
                  0,
                  0,
                ),
                blurRadius: 4,
                spreadRadius: 2),
          ],
        );
}
