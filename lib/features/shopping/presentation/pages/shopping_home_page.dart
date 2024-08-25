import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/core/utils/helper.dart';
import 'package:clean_architecture/core/utils/widgets/nodata_widget.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/category/category_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/special_product_list/special_product_list_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/widgets/image_slider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingHomePage extends StatelessWidget {
  const ShoppingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(context),
        appBar: _buildAppbar(),
        body: _buildBody(context));
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Shopping'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: ImageSlider(),
        ),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryInitial) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is CategoryLoaded) {
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Danh mục sản phẩm", style: AppText.titleSM),
                            Text("Tất cả(${state.categoryList.length})"),
                          ])),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoryList.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Application.navigateTo(
                                  context,
                                  "${Routes.productList}/${state.categoryList[index].id}/${state.categoryList[index].name}",
                                  TransitionType.inFromRight);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            state.categoryList[index].image ??
                                                ""),
                                        fit: BoxFit.contain,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Text(state.categoryList[index].name ?? ""),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const NoDataWidget();
            }
          },
        ),
        Expanded(
          child: BlocBuilder<SpecialProductListCubit, SpecialProductListState>(
            builder: (context, state) {
              if (state is SpecialProductListInitial) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is SpecialProductListLoaded) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Sản phẩm đặt biệt", style: AppText.titleSM),
                              Text("Tất cả(${state.productList.length})"),
                            ])),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image(
                                image: NetworkImage(
                                    state.productList[index].image ?? ""),
                                fit: BoxFit.fill),
                            title: Text(state.productList[index].name ?? ""),
                            subtitle: Text(
                                "${Helper.addThousandSeparator(state.productList[index].price ?? 0)} vnđ"),
                            trailing: const Icon(Icons.shopping_cart),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 1,
                          );
                        },
                        itemCount: state.productList.length,
                      ),
                    )
                  ],
                );
              } else {
                return const NoDataWidget();
              }
            },
          ),
        ),
      ],
    );
  }
}
