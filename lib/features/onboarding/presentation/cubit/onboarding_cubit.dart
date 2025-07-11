import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void nextPage() => emit(state + 1);
  void changePage(int index) => emit(index);
  bool isLastPage(int totalPages) => state == totalPages - 1;
}