import 'package:anwel/core/extensions/navigation_extensions.dart';
import 'package:anwel/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/network/handle_data_view.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/snackbar_helper.dart';
import '../../../signup/presentation/widgets/image_auth.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showCustomSnackBar(
              context,
              message: 'جاري تسجيل الدخول...',
              type: SnackBarType.loading,
              duration: const Duration(seconds: 2),
            );
          } else if (state is LoginSuccess) {
            showCustomSnackBar(
              context,
              message: '🎉 مرحبًا بك، تم تسجيل الدخول بنجاح!',
              type: SnackBarType.success,
            );
            context.pushNamed(Routes.homeScreen);
          } else if (state is LoginFailure) {
            showCustomSnackBar(
              context,
              message: 'حدث خطأ أثناء تسجيل الدخول. حاول مرة أخرى!',
              type: SnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          final controller = context.read<LoginCubit>();

          return HandleDataView(
            state: controller.viewState,
            errorMessage: state is LoginFailure ? state.error : null,
            successWidget: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: controller.formKey,
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
            ),
          );
        },
      ),
    );
  }
}
