import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> doSomething() async {
    emit(SignupLoading());
    try {
      // Call usecase
      // emit(SignupSuccess(result));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
