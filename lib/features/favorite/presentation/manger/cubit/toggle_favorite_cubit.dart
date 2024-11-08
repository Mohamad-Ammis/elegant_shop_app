import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/features/favorite/data/repos/favorite_repo.dart';
import 'package:meta/meta.dart';

part 'toggle_favorite_state.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  ToggleFavoriteCubit({required this.favoriteRepo})
      : super(ToggleFavoriteInitial());
  final FavoriteRepo favoriteRepo;
  Future<bool> toggleFavorite({required String productID}) async {
    bool status = false;
    try {
      try {
        emit(ToggleFavoriteLoading());
        var data = await favoriteRepo.toggleFavorite(productID: productID);
        data.fold((failure) {
          status = false;
          return ServerFailure(errorMessage: failure.errorMessage);
        }, (data) {
          status = data;
          if (data) {
            emit(ToggleFavoriteSuccess());
          }
          emit(ToggleFavoriteFailure(errMessage: 'un expected errror'));
        });
        return status;
      } catch (e) {
        status = false;
        emit(ToggleFavoriteFailure(errMessage: e.toString()));
        return status;
      }
    } on StateError catch (e) {
      log('e: $e');
      return status;
      // 
    }
  }
}
