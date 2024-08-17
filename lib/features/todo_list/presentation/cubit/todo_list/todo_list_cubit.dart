import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListInitial()) {
    _loadTodos();
  }

  void _loadTodos() {
    Future.delayed(const Duration(seconds: 1), () {
      emit(const TodoListLoaded([]));
    });
  }

  void loadTodos() {
    emit(const TodoListLoaded([]));
  }

  void addTodo(String title) {
    if (state is TodoListLoaded) {
      final currentState = state as TodoListLoaded;
      final newTodo = title;
      final updatedTodos = List<String>.from(currentState.todos)..add(newTodo);
      emit(TodoListLoaded(updatedTodos));
    }
  }

  void deleteTodo(String title) {
    if (state is TodoListLoaded) {
      final currentState = state as TodoListLoaded;
      final updatedTodos =
          currentState.todos.where((todo) => todo != title).toList();
      emit(TodoListLoaded(updatedTodos));
    }
  }
}
