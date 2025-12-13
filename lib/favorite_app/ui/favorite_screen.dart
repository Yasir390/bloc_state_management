import 'package:bloc_state_management/favorite_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:bloc_state_management/favorite_app/bloc/favorite_event/favorite_event.dart';
import 'package:bloc_state_management/favorite_app/bloc/favorite_state/favorite_state.dart';
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
                itemCount: state.favoriteItemList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.favoriteItemList[index].value),
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
