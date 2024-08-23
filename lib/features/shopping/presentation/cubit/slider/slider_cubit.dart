import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/shopping/domain/entities/slider.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_sliders_usecase.dart';
import 'package:equatable/equatable.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final GetSlidersUseCase _getSlidersUseCate;

  SliderCubit(this._getSlidersUseCate) : super(SliderInitial()) {
    _getSliders();
  }

  void _getSliders() async {
    try {
      final data = await _getSlidersUseCate();
      emit(SliderLoaded(data.data ?? []));
    } catch (e) {
      emit(const SliderError('Failed to load slider'));
    }
  }
}
