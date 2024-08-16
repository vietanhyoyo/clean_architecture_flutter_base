import 'package:clean_architecture/features/favorite_images/presentation/cubit/favorite_image/favorite_image_cubit.dart';
import 'package:clean_architecture/features/favorite_images/presentation/widgets/swipe_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteImagesPage extends StatelessWidget {
  const FavoriteImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteImageCubit, FavoriteImageState>(
        builder: (context, state) {
      return Scaffold(
          appBar: _buildAppbar(context, state),
          body: _buildBody(context, state));
    });
  }

  PreferredSizeWidget _buildAppbar(
      BuildContext context, FavoriteImageState state) {
    return AppBar(
        title: Row(
          children: [
            const Text('Favorite Images'),
            if (state is FavoriteImageLoaded)
              Badge(
                  label: Text(state.imageList
                      .where((item) => item.like == true)
                      .length
                      .toString()),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.favorite, size: 30),
                  ))
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Show all') {
                print('Option 1 selected');
              } else if (value == 'Favorites') {
                print('Option 2 selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Show all', 'Favorites'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: const Icon(Icons.more_vert),
          ),
        ]);
  }

  Widget _buildBody(BuildContext context, FavoriteImageState state) {
    if (state is FavoriteImageLoaded) {
      return SwipeBody(
        imageList: state.imageList,
      );
    } else {
      return Container();
    }
  }
}
