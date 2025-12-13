import 'package:equatable/equatable.dart';

abstract class FavoriteItemEvent extends Equatable{
 
 const FavoriteItemEvent();
  @override
  List<Object?> get props => [];
}

class FetchFavoriteListEvent extends FavoriteItemEvent{}