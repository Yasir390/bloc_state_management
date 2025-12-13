import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/favorite_app/bloc/favorite_event/favorite_event.dart';
import 'package:bloc_state_management/favorite_app/bloc/favorite_state/favorite_state.dart';
import 'package:bloc_state_management/favorite_app/model/favorite_item_model.dart';
import 'package:bloc_state_management/favorite_app/repository/favorite_repository.dart';

class FavoriteItemBloc extends Bloc<FavoriteItemEvent,FavoriteItemState>{
  FavoriteRepository favoriteRepository;
  List<FavoriteItemModel> favoriteItemList=[];
  FavoriteItemBloc(this.favoriteRepository):super(const FavoriteItemState()){
   on<FetchFavoriteListEvent>(_fetchList);
  }

  FutureOr<void> _fetchList(FetchFavoriteListEvent event, Emitter<FavoriteItemState> emit)async {
   favoriteItemList= await favoriteRepository.fetchItem();
    emit(state.copyWith(favoriteItemList:favoriteItemList ,listStatus:ListStatus.success ));
  }
}