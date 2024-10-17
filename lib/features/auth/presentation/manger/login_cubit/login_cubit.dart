import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
   final AuthRepo authRepo;

  Future<void> login(
      {required String userName,required String password}) async {
    try {
      emit(LoginLoading());
      var data = await authRepo.signIn(userName: userName,password: password);
      data.fold((l) {
        emit(LoginFailure(errMessage: l.errorMessage));
      }, (r) {
        if (r == true) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(errMessage: 'Unexpected error'));
        }
      });
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
