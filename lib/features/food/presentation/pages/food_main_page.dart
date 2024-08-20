import 'package:clean_architecture/features/food/presentation/cubit/bottom_bar/botton_bar_cubit.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_home/food_home_cubit.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_favorite_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_home_page.dart';
import 'package:clean_architecture/features/food/presentation/pages/food_viewed_page.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodMainPage extends StatelessWidget {
  FoodMainPage({super.key});

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => sl<FoodHomeCubit>(),
      child: const FoodHomePage(),
    ),
    FoodViewedPage(),
    FoodFavoritePage()
  ];

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
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return _pages[state];
      },
    );
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
