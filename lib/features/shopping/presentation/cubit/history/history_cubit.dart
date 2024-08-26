import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/shopping/domain/entities/bill.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/get_history_list_usacase.dart';
import 'package:equatable/equatable.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase _getHistoryUseCase;
  HistoryCubit(this._getHistoryUseCase) : super(HistoryInitial()) {
    _getHistory();
  }

  void _getHistory() async {
    try {
      final data = await _getHistoryUseCase();
      emit(HistoryLoaded(data.data ?? []));
    } catch (e) {
      emit(const HistoryError('Failed to load history'));
    }
  }
}
