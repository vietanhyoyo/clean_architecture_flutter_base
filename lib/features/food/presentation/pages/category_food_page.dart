import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/food/presentation/widgets/food_detail_card.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFoodPage extends StatelessWidget {
  final String title;
  final String categoryId;

  const CategoryFoodPage(this.title, this.categoryId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: Text(title),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<FoodMainCubit, FoodMainState>(
      builder: (context, state) {
        if (state is FoodMainInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is FoodMainLoaded) {
          final productList = state.productList
              .where((element) => element.categoryId == categoryId)
              .toList();
          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Application.navigateTo(
                          context,
                          "${Routes.detailFood}/${productList[index].id}/${productList[index].title}",
                          TransitionType.inFromRight);
                    },
                    child: FoodDetailCard(
                        foodItem: productList[index],
                        onTap: () {
                          context
                              .read<FoodMainCubit>()
                              .toggleIsLiked(productList[index].id ?? "");
                        })),
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
