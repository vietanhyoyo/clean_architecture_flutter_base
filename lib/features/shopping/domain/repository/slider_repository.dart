import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/shopping/domain/entities/slider.dart';

abstract class SliderRepository {
  Future<DataState<List<SliderEntity>>> getSliders();
}
