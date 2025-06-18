import 'package:anwel/core/extensions/navigation_extensions.dart';
import 'package:anwel/features/auth/signup/presentation/widgets/image_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';
import 'package:anwel/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/sign_up_view.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: const SignupView(),
    );
  }
}


