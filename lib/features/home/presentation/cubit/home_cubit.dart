import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void changePage(int index) => emit(index);
}