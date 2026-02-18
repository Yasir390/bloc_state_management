import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/bloc/favorite_event/favorite_event.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/bloc/favorite_state/favorite_state.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/model/favorite_item_model.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/repository/favorite_repository.dart';

class FavoriteItemBloc extends Bloc<FavoriteItemEvent, FavoriteItemState> {
  FavoriteRepository favoriteRepository;
  List<FavoriteItemModel> favoriteItemList = [];
  FavoriteItemBloc(this.favoriteRepository) : super(const FavoriteItemState()) {
    on<FetchFavoriteListEvent>(_fetchList);
    on<FavoriteItemToggleEvent>(_addFavoriteItemEvent);
  }

  FutureOr<void> _fetchList(
    FetchFavoriteListEvent event,
    Emitter<FavoriteItemState> emit,
  ) async {
    favoriteItemList = await favoriteRepository.fetchItem();
    emit(
      state.copyWith(
        favoriteItemList: favoriteItemList,
        listStatus: ListStatus.success,
      ),
    );
  }


FutureOr<void> _addFavoriteItemEvent(
  FavoriteItemToggleEvent event,
  Emitter<FavoriteItemState> emit,
) {
  final updatedList = state.favoriteItemList.map((item) {
    if (item.id == event.itemModel.id) {
      return event.itemModel;
    }
    return item;
  }).toList();

  emit(state.copyWith(favoriteItemList: updatedList));
}


  // FutureOr<void> _addFavoriteItemEvent(
  //   FavoriteItemToggleEvent event,
  //   Emitter<FavoriteItemState> emit,
  // ) {
  //   final index = favoriteItemList.indexWhere(
  //     (element) => element.id == event.itemModel.id,
  //   );

  //   favoriteItemList[index]=event.itemModel;
  //   emit(state.copyWith(favoriteItemList: List.from(favoriteItemList)));
  // }
}
