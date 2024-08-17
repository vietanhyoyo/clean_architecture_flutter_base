import 'package:clean_architecture/core/constants/app_colors.dart';
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
          appBar: _buildAppbar(
              context, state is FavoriteImageLoaded ? state.favoriteTotal : 0),
          body: _buildBody(context, state));
    });
  }

  PreferredSizeWidget _buildAppbar(BuildContext context, int number) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Favorite Images'),
          if (number > 0)
            Badge(
                label: Text(number.toString()),
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
              context.read<FavoriteImageCubit>().handleChangeShowState(false);
            } else if (value == 'Favorites') {
              context.read<FavoriteImageCubit>().handleChangeShowState(true);
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
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, FavoriteImageState state) {
    if (state is FavoriteImageLoaded) {
      if (!state.showFavorite) {
        return SwipeBody(
          imageList: state.imageList,
        );
      } else {
        return SwipeBody(
          imageList:
              state.imageList.where((item) => item.like == true).toList(),
        );
      }
    } else if (state is FavoriteImageInitial) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    {
      return Container();
    }
  }
}
