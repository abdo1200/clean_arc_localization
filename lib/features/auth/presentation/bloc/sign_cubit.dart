import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

part 'sign_state.dart';

@injectable
class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool useAgree = false;

  void toOtp() {
    emit(OtpStep());
  }

  void toLogin() {
    emit(SignLoaded(step: 3));
  }
}
