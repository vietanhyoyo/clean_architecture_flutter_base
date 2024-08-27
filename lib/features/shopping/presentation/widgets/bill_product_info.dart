import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_product_details_usecase.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:flutter/material.dart';

class BillProductInfo extends StatefulWidget {
  final int productId;
  const BillProductInfo(this.productId, {super.key});

  @override
  State<BillProductInfo> createState() => _BillProductInfoState();
}

class _BillProductInfoState extends State<BillProductInfo> {
  late final GetProductDetailsUseCase getProductDetailsUseCase =
      GetProductDetailsUseCase(sl());
  ProductEntity? _productEntiry;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  void _fetchProductDetails() async {
    try {
      final data =
          await getProductDetailsUseCase(params: widget.productId.toString());
      if (data.data != null) {
        setState(() {
          _productEntiry = data.data!;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox();
    } else if (_productEntiry != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListTile(
            leading: Image.network(_productEntiry!.image ?? ""),
            title: Text(_productEntiry!.name ?? "")),
      );
    } else {
      return const SizedBox();
    }
  }
}
