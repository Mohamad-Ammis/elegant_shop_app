import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:elegant_shop_app/widgets/custom_pass_text_field.dart';
import 'package:elegant_shop_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  @override
  void initState() {
    autoValidateMode = AutovalidateMode.disabled;
    formKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
              borderRadius: 12,
              isUserName: true,
              textStyle: Styles.style14Regular,
              cursorColor: Colors.black,
              label: 'Name',
              labelStyle: Styles.style16Regular.copyWith(color: Colors.black54),
              filled: true,
              fillColor: kLightGreyColor,
              focusedBorderColor: Colors.transparent,
              enabledBorderColor: Colors.transparent,
              suffixIcon: Icons.person),
          16.verticalSizedBox,
          CustomTextField(
              borderRadius: 12,
              isEmail: true,
              textStyle: Styles.style14Regular,
              cursorColor: Colors.black,
              label: 'Email',
              labelStyle: Styles.style16Regular.copyWith(color: Colors.black54),
              filled: true,
              fillColor: kLightGreyColor,
              focusedBorderColor: Colors.transparent,
              enabledBorderColor: Colors.transparent,
              suffixIcon: Icons.email_rounded),
          16.verticalSizedBox,
          CustomPasswordTextField(
            borderRadius: 12,
            textStyle: Styles.style14Regular,
            cursorColor: Colors.black,
            label: 'Password',
            labelStyle: Styles.style16Regular.copyWith(color: Colors.black54),
            filled: true,
            fillColor: kLightGreyColor,
            focusedBorderColor: Colors.transparent,
            enabledBorderColor: Colors.transparent,
          ),
          16.verticalSizedBox,
          CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  log('validate');
                  formKey.currentState!.save();
                  setState(() {});
                } else {
                  autoValidateMode = AutovalidateMode.onUserInteraction;
                  setState(() {});
                }
              },
              borderRadius: BorderRadius.circular(12),
              color: kPrimaryColor,
              child: Center(
                child: Text(
                  'Register',
                  style: Styles.style18Bold.copyWith(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}

