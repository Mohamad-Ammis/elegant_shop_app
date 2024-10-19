
import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/home/data/models/category_model/category_model.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.homeRepo}) : super(CategoryInitial());
  final HomeRepo homeRepo;
  

  Future<void> getAllCategories() async {
    try {
      emit(CategoryLoading());
      var data = await homeRepo.getAllCategories();
      data.fold((left) {
        emit(CategoryFailure(errMessage: left.errorMessage));
      }, (right) {
        emit(CategorySuccess(categories: right));
      });
    } catch (e) {
      emit(CategoryFailure(errMessage: e.toString()));
    }
  }
}
