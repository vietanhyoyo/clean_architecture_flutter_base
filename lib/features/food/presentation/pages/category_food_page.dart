import 'package:clean_architecture/features/food/presentation/cubit/category_food/category_food_cubit.dart';
import 'package:clean_architecture/features/food/presentation/pages/detail_food_page.dart';
import 'package:clean_architecture/features/food/presentation/widgets/food_detail_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFoodPage extends StatelessWidget {
  const CategoryFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Category'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CategoryFoodCubit, CategoryFoodState>(
      builder: (context, state) {
        if (state is CategoryFoodInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is CategoryFoodLoaded) {
          return ListView.builder(
            itemCount: state.productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailFoodPage()),
                      );
                    },
                    child: FoodDetailCard(foodItem: state.productList[index])),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
