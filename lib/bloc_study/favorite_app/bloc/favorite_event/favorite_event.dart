import 'package:bloc_state_management/bloc_study/favorite_app/model/favorite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteItemEvent extends Equatable {
  const FavoriteItemEvent();
  @override
  List<Object?> get props => [];
}

class FetchFavoriteListEvent extends FavoriteItemEvent {}

class FavoriteItemToggleEvent extends FavoriteItemEvent {
  final FavoriteItemModel itemModel;
  const FavoriteItemToggleEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];
}
