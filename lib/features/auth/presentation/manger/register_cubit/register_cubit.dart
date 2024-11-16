import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/auth/data/models/register_input_model.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> register(
      {required RegisterInputModel registerInputModel}) async {
    try {
  try {
    emit(RegisterLoading());
    var data = await authRepo.signUp(registerInputModel: registerInputModel);
    data.fold((l) {
      emit(RegisterFailure(errMessage: l.errorMessage));
    }, (r) {
      if (r == true) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errMessage: 'Unexpected error'));
      }
    });
  } catch (e) {
    emit(RegisterFailure(errMessage: e.toString()));
  }
} on StateError catch (e) {
  log('e: $e');
}
  }
}
