part of 'todo_list_cubit.dart';

sealed class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object> get props => [];
}

final class TodoListInitial extends TodoListState {}

final class TodoListLoaded extends TodoListState {
  final List<String> todos;

  const TodoListLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}
