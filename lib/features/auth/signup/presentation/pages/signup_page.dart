import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_state.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Signup Page')),
        body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            if (state is SignupLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SignupFailure) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('Signup Page'));
          },
        ),
      ),
    );
  }
}
