import 'dart:developer';

import 'package:bloc/bloc.dart';

class CategoryHelperCubit extends Cubit<bool> {
  CategoryHelperCubit(super.initialState);
  bool showCategory = false;
  changeCategoryState() {
    log(showCategory.toString());
    if (showCategory) {
      emit(true);
      showCategory = !showCategory;
    } else {
      emit(false);
      showCategory = !showCategory;
    }
  }
}
