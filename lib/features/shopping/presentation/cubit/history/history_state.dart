part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final List<BillEntity> orderList;

  const HistoryLoaded(this.orderList);

  @override
  List<Object> get props => [orderList];
}

final class HistoryError extends HistoryState {
  final String message;

  const HistoryError(this.message);

  @override
  List<Object> get props => [message];
}
