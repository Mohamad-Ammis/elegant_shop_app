// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/image_picker_service.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/auth/data/models/register_input_model.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:elegant_shop_app/widgets/custom_pass_text_field.dart';
import 'package:elegant_shop_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  late String user;
  late String email;
  late String password;
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
              onChanged: (p0) {
                user = p0;
              },
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
              onChanged: (p0) {
                email = p0;
              },
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
            onChanged: (p0) {
              password = p0;
            },
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
          BlocConsumer<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomButton(
                  height: 60,
                  onTap: state is RegisterLoading
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            log('validate');
                            formKey.currentState!.save();
                            setState(() {});
                            var image = await ImagePickerService().loadImage();
                            log(image.toString());
                            await BlocProvider.of<RegisterCubit>(context)
                                .register(
                                    registerInputModel: RegisterInputModel(
                                        userName: user,
                                        email: email,
                                        password: password,
                                        image: image));
                          } else {
                            autoValidateMode =
                                AutovalidateMode.onUserInteraction;
                            setState(() {});
                          }
                        },
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColor,
                  child: state is RegisterLoading
                      ? const CustomLoadingWidget(
                          color: Colors.white,
                        )
                      : Center(
                          child: Text(
                            'Register',
                            style: Styles.style18Bold
                                .copyWith(color: Colors.white),
                          ),
                        ));
            },
            listener: (BuildContext context, RegisterState state) {
              if (state is RegisterSuccess) {
                showSuccesSnackBar('Register Success',
                        "Your account has been created successfully")
                    .show(context);
                GoRouter.of(context).pop();
              } else if (state is RegisterFailure) {
                showErrorSnackBar('Error Happened', state.errMessage)
                    .show(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
