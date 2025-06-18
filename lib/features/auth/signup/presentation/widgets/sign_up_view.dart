import 'package:anwel/core/extensions/navigation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/network/handle_data_view.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';
import 'image_auth.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          final controller = context.read<SignupCubit>();

          return HandleDataView(
            state: controller.viewState,
            errorMessage: state is SignupFailure ? state.error : null,
            successWidget: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageAuth(),
                  CustomTextField(
                    hint: 'mail',
                    icon: Icons.mail_outline,
                    controller: controller.emailController,
                  ),
                  12.verticalSpace,
                  CustomTextField(
                    hint: 'password',
                    icon: Icons.lock_outline,
                    obscure: true,
                    controller: controller.passwordController,
                  ),
                  12.verticalSpace,
                  CustomTextField(
                    hint: 'confirm password',
                    icon: Icons.lock_outline,
                    obscure: true,
                    controller: controller.confirmPasswordController,
                  ),
                  24.verticalSpace,
                  CustomAuthButton(
                    text: 'Sign up',
                    onPressed: () => controller.signup(),
                  ),
                  12.verticalSpace,
                  CustomTextButton(
                    text: 'Already have an account?',
                    onTap: () => context.back(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}