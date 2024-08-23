part of 'slider_cubit.dart';

sealed class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object> get props => [];
}

final class SliderInitial extends SliderState {}

final class SliderLoaded extends SliderState {
  final List<SliderEntity> imageSlider;

  const SliderLoaded(this.imageSlider);

  @override
  List<Object> get props => [imageSlider];
}

final class SliderError extends SliderState {
  final String message;

  const SliderError(this.message);

  @override
  List<Object> get props => [message];
}
