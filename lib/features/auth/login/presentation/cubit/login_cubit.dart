import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/handle_data_view.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ViewState get viewState {
    if (state is LoginLoading) return ViewState.loading;
    if (state is LoginFailure) return ViewState.error;
    if (state is LoginSuccess) return ViewState.success;
    return ViewState.success;
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoading());
      try {
        // Auth Logic here
        await Future.delayed(const Duration(seconds: 2));

        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
