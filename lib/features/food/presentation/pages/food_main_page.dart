import 'package:clean_architecture/core/utils/widgets/nodata_widget.dart';
import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_favorite_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_home_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_viewed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodMainPage extends StatelessWidget {
  const FoodMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Good Food'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<FoodMainCubit, FoodMainState>(builder: (context, state) {
      if (state is FoodMainLoaded) {
        final favoriteList =
            state.productList.where((item) => item.isLiked == true).toList();
        final viewedList =
            state.productList.where((item) => item.isViewed == true).toList();
        final List<Widget> pages = [
          FoodHomePage(categoryList: state.categoryList),
          FoodViewedPage(
            productList: viewedList,
            handleDismiss: () {},
          ),
          FoodFavoritePage(
            productList: favoriteList,
            handleDismiss: () {},
          )
        ];
        return BlocBuilder<BottomBarCubit, int>(
          builder: (context, state) {
            return pages[state];
          },
        );
      } else {
        return const NoDataWidget();
      }
    });
  }

  Widget _bottomNavigationBar() {
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (value) {
            context.read<BottomBarCubit>().handleChangePage(value);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              label: 'Viewed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        );
      },
    );
  }
}
