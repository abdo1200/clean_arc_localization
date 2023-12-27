import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bool useAgree = false;

  // void toOtp() {
  //   emit(OtpStep());
  // }

  void toLogin() {
    emit(HomeInitial());
  }

  void logout() {
    emit(LogOut());
  }
}
