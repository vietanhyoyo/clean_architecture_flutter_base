import 'package:clean_architecture/core/utils/helper.dart';
import 'package:clean_architecture/core/utils/widgets/nodata_widget.dart';
import 'package:clean_architecture/features/shopping/domain/entities/cart_item.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/cart/cart_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/widgets/alert_loading.dart';
import 'package:clean_architecture/features/shopping/presentation/widgets/alert_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void hanldeOrder(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return alertLoading;
        });
    Future.delayed(const Duration(seconds: 3), (() {
      Navigator.pop(context);
      context.read<CartCubit>().makeOrder();
      context.read<CartCubit>().removeAll();
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return alertSuccess;
          });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
      persistentFooterButtons: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Buy"),
                  onPressed: () {
                    hanldeOrder(context);
                  },
                )))
      ],
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text("Card"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is CartLoaded) {
          if (state.cartList.isEmpty) {
            return NoDataWidget();
          }
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              // Get the cart item safely using entries to avoid null key issues
              final cartItemEntry = state.cartList.entries.elementAt(index);
              final cartItem = cartItemEntry.value;
              return ListTile(
                leading: Image(
                    image: NetworkImage(cartItem.image ?? ""),
                    fit: BoxFit.fill),
                title: const Text("Name"),
                subtitle: Text(
                    "${Helper.addThousandSeparator(cartItem.price ?? 0)} vnđ"),
                trailing: SizedBox(
                    width: MediaQuery.of(context).size.width / 3.4,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .removeCart(cartItem.id ?? 0);
                            },
                            icon: const Icon(Icons.remove)),
                        Text(cartItem.quantity.toString()),
                        IconButton(
                            onPressed: () {
                              context.read<CartCubit>().addCart(CartItemEntity(
                                    id: cartItem.id,
                                    name: cartItem.name,
                                    image: cartItem.image,
                                    price: cartItem.price,
                                    quantity: 1,
                                  ));
                            },
                            icon: const Icon(Icons.add))
                      ],
                    )),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 1,
              );
            },
            itemCount: state.cartList.length,
          );
        } else {
          return const NoDataWidget();
        }
      },
    );
  }
}
