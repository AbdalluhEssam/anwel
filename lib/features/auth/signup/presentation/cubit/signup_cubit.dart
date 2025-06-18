import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/handle_data_view.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ViewState get viewState {
    if (state is SignupLoading) return ViewState.loading;
    if (state is SignupFailure) return ViewState.error;
    if (state is SignupSuccess) return ViewState.success;
    return ViewState.success;
  }

  Future<void> signup() async {
    if (formKey.currentState?.validate() == true) {
      emit(SignupLoading());
      try {
        // Auth Logic here
        await Future.delayed(const Duration(seconds: 2));
        emit(SignupSuccess());
      } catch (e) {
        emit(SignupFailure(e.toString()));
      }
    }
  }
}
