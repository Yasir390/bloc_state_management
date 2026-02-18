import 'package:bloc_state_management/bloc_study/favorite_app/model/favorite_item_model.dart';
import 'package:equatable/equatable.dart';

class FavoriteItemState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final ListStatus listStatus;

  const FavoriteItemState({
    this.favoriteItemList = const [],
     this.listStatus =ListStatus.loading,
  });

  FavoriteItemState copyWith({List<FavoriteItemModel>? favoriteItemList,ListStatus? listStatus}){
    return FavoriteItemState(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      listStatus: listStatus ?? this.listStatus
    );
  }
  @override
  List<Object?> get props => [favoriteItemList, listStatus];
}

enum ListStatus { loading, success, failure }
