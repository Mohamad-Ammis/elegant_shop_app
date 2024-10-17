import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:elegant_shop_app/widgets/custom_pass_text_field.dart';
import 'package:elegant_shop_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  String password = '';
  String userName = '';
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
                userName = p0;
              },
              borderRadius: 12,
              isUserName: true,
              textStyle: Styles.style14Regular,
              cursorColor: Colors.black,
              label: 'User name',
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
          BlocConsumer<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomButton(
                  height: 60,
                  onTap: state is LoginLoading
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            log('validate');
                            formKey.currentState!.save();
                            setState(() {});
                            await BlocProvider.of<LoginCubit>(context)
                                .login(password: password, userName: userName);
                          } else {
                            autoValidateMode =
                                AutovalidateMode.onUserInteraction;
                            setState(() {});
                          }
                        },
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColor,
                  child: state is LoginLoading
                      ? const CustomLoadingWidget(
                          color: Colors.white,
                        )
                      : Center(
                          child: Text(
                            'Login',
                            style: Styles.style18Bold
                                .copyWith(color: Colors.white),
                          ),
                        ));
            },
            listener: (BuildContext context, LoginState state) {
              if (state is LoginSuccess) {
                showSuccesSnackBar('Login Success', "Enjoy in our app")
                    .show(context);
                GoRouter.of(context).push(AppRouter.kHomeView);
              } else if (state is LoginFailure) {
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
