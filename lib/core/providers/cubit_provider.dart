import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/cart/cart_cubit.dart';
import 'package:clean_architecture/injection_container.dart';

final foodMainCubit = sl<FoodMainCubit>();
final cartCubit = sl<CartCubit>();
