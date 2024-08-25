import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/core/utils/widgets/nodata_widget.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/category/category_cubit.dart';
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
    return Scaffold(appBar: _buildAppbar(), body: _buildBody(context));
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
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Danh mục sản phẩm", style: AppText.titleSM),
                  const Text("Tất cả(30)"),
                ])),
        SizedBox(
          height: 100,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is CategoryLoaded) {
                return ListView.separated(
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
                                        state.categoryList[index].image ?? ""),
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
