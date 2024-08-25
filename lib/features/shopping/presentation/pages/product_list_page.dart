import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/arguments/product_argument.dart';
import 'package:clean_architecture/core/utils/widgets/nodata_widget.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatelessWidget {
  final String categoryId;
  final String title;
  const ProductListPage(
      {super.key, required this.categoryId, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody(context));
  }

  _buildAppbar() {
    return AppBar(
      title: Text(title),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
        if (state is ProductListInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is ProductListLoaded) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            itemCount: state.productList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  child: ProductCard(
                    product: state.productList[index],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.productInfo,
                      arguments: ProductArguments(state.productList[index]),
                    );
                  });
            },
          );
        } else {
          return const NoDataWidget();
        }
      }),
    );
  }
}
