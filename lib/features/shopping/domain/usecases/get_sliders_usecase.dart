import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/shopping/domain/entities/slider.dart';
import 'package:clean_architecture/features/shopping/domain/repository/slider_repository.dart';

class GetSlidersUseCase
    implements UseCase<DataState<List<SliderEntity>>, void> {
  final SliderRepository _sliderRepository;

  GetSlidersUseCase(this._sliderRepository);

  @override
  Future<DataState<List<SliderEntity>>> call({void params}) {
    return _sliderRepository.getSliders();
  }
}
