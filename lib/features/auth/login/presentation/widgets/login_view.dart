import 'package:anwel/core/extensions/navigation_extensions.dart';
import 'package:anwel/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/network/handle_data_view.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../signup/presentation/widgets/image_auth.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final controller = context.read<LoginCubit>();

          return HandleDataView(
            state: controller.viewState,
            errorMessage: state is LoginFailure ? state.error : null,
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
                  24.verticalSpace,
                  CustomAuthButton(
                    text: 'Log in',
                    onPressed: () => controller.login(),
                  ),
                  12.verticalSpace,
                  CustomTextButton(
                    text: 'Create an account',
                    onTap: () => context.pushNamed(Routes.signupScreen),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
