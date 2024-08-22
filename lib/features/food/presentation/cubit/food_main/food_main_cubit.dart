import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/food/data/models/product.dart';
import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_category_list.dart';
import 'package:clean_architecture/features/food/domain/usecases/get_product_list.dart';
import 'package:equatable/equatable.dart';

part 'food_main_state.dart';

class FoodMainCubit extends Cubit<FoodMainState> {
  final GetCategoryListUseCase _getCategoryListUseCate;
  final GetProductListUseCase _getProductListUseCate;

  FoodMainCubit(this._getCategoryListUseCate, this._getProductListUseCate)
      : super(FoodMainInitial()) {
    _getCategoryList();
  }

  void _getCategoryList() async {
    try {
      print("FoodMainCubit loading");
      final categoryData = await _getCategoryListUseCate();
      final productData = await _getProductListUseCate();
      emit(FoodMainLoaded(categoryData, productData));
    } catch (e) {
      emit(const FoodMainError('Failed to load category'));
    }
  }

  void toggleIsLiked(String productId) {
    if (state is FoodMainLoaded) {
      final currentState = state as FoodMainLoaded;

      final List<ProductEntity> newProductList =
          currentState.productList.map((item) {
        return productId == item.id
            ? ProductModel(
                id: item.id,
                categoryId: item.categoryId,
                title: item.title,
                image: item.image,
                intro: item.intro,
                ingredients: item.ingredients,
                instructions: item.instructions,
                view: item.view,
                favorite: item.favorite,
                isLiked: !item.isLiked!,
                isViewed: item.isViewed)
            : item;
      }).toList();
      emit(FoodMainLoaded(currentState.categoryList, newProductList));
    }
  }

  void increaseView(String productId) {
    if (state is FoodMainLoaded) {
      final currentState = state as FoodMainLoaded;

      final List<ProductEntity> newProductList =
          currentState.productList.map((item) {
        return productId == item.id
            ? ProductModel(
                id: item.id,
                categoryId: item.categoryId,
                title: item.title,
                image: item.image,
                intro: item.intro,
                ingredients: item.ingredients,
                instructions: item.instructions,
                view: (int.tryParse(item.view ?? "0")! + 1).toString(),
                favorite: item.favorite,
                isLiked: item.isLiked,
                isViewed: item.isViewed)
            : item;
      }).toList();
      emit(FoodMainLoaded(currentState.categoryList, newProductList));
    }
  }

  void setViewed(String productId) {
    if (state is FoodMainLoaded) {
      final currentState = state as FoodMainLoaded;

      final List<ProductEntity> newProductList =
          currentState.productList.map((item) {
        return productId == item.id
            ? ProductModel(
                id: item.id,
                categoryId: item.categoryId,
                title: item.title,
                image: item.image,
                intro: item.intro,
                ingredients: item.ingredients,
                instructions: item.instructions,
                view: item.view,
                favorite: item.favorite,
                isLiked: item.isLiked,
                isViewed: true)
            : item;
      }).toList();
      emit(FoodMainLoaded(currentState.categoryList, newProductList));
    }
  }

  void unSetViewed(String productId) {
    if (state is FoodMainLoaded) {
      final currentState = state as FoodMainLoaded;

      final List<ProductEntity> newProductList =
          currentState.productList.map((item) {
        return productId == item.id
            ? ProductModel(
                id: item.id,
                categoryId: item.categoryId,
                title: item.title,
                image: item.image,
                intro: item.intro,
                ingredients: item.ingredients,
                instructions: item.instructions,
                view: item.view,
                favorite: item.favorite,
                isLiked: item.isLiked,
                isViewed: false)
            : item;
      }).toList();
      emit(FoodMainLoaded(currentState.categoryList, newProductList));
    }
  }
}
