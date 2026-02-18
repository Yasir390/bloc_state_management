import 'package:bloc_state_management/bloc_study/favorite_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/bloc/favorite_event/favorite_event.dart';
import 'package:bloc_state_management/bloc_study/favorite_app/bloc/favorite_state/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteItemBloc>().add(FetchFavoriteListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Items")),
      body: BlocBuilder<FavoriteItemBloc, FavoriteItemState>(
        builder: (BuildContext context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            case ListStatus.failure:
              return Text("Alas! Error");
            case ListStatus.success:
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.favoriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favoriteItemList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.value),
                      trailing: IconButton(
                        onPressed: () {
                          final updatedItem = item.copyWith(
                            isFavorite: !item.isFavorite,
                          );
                          context.read<FavoriteItemBloc>().add(
                            FavoriteItemToggleEvent(itemModel: updatedItem),
                          );
                          // FavoriteItemModel itemModel = FavoriteItemModel(
                          //   id: item.id,
                          //   value: item.value,
                          //   isFavorite: item.isFavorite ? false : true,
                          // );
                          // context.read<FavoriteItemBloc>().add(
                          //   FavoriteItemToggleEvent(itemModel: itemModel),
                          // );
                        },
                        icon: Icon(
                          item.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
