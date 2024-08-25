import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/features/shopping/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductInfoPage extends StatelessWidget {
  final ProductEntity product;
  const ProductInfoPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      persistentFooterButtons: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Add product"),
                  onPressed: () {},
                )))
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 400,
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.menu, size: 30, color: Colors.transparent),
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(product.name ?? "", style: AppText.titleSM,),
            background: Padding(
                padding: const EdgeInsets.all(60),
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(product.image ?? ""),
                )),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  product.description ?? "",
                  maxLines: 10,
                ),
              ),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(onPressed: () {}, child: const Icon(Icons.remove)),
                const SizedBox(width: 30),
                const Text("1"),
                const SizedBox(width: 30),
                ElevatedButton(onPressed: () {}, child: const Icon(Icons.add))
              ])
            ],
          ),
        ))
      ],
    );
  }
}
