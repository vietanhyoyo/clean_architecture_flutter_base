import 'package:clean_architecture/common/widgets/reusable_input.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/features/todo_list/presentation/cubit/todo_list/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            builder: (modalContext) {
              return AddTodoModal(
                parentContext: context,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Todo List'),
    );
  }

  _buildBody(BuildContext parentContext) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocBuilder<TodoListCubit, TodoListState>(
              builder: (context, state) {
                if (state is TodoListLoaded) {
                  return state.todos.isNotEmpty
                      ? ListView.builder(
                          itemCount: state.todos.length,
                          itemBuilder: (context, index) {
                            final todo = state.todos[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Card(
                                  child: ListTile(
                                title: Text(todo),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8.0),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _showDeleteConfirmationDialog(
                                        context, todo);
                                  },
                                ),
                              )),
                            );
                          },
                        )
                      : const Center(child: Text("Empty data"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext parentContext, String todo) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                parentContext.read<TodoListCubit>().deleteTodo(todo);
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class AddTodoModal extends StatelessWidget {
  final BuildContext parentContext;
  final TextEditingController _todoController = TextEditingController();

  AddTodoModal({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(parentContext).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColors.black : AppColors.white;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor, // Màu nền dựa trên chế độ sáng/tối
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ), // BorderRadius cho phần trên
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          ReusableInput(
            controller: _todoController,
            labelText: 'Enter a task',
            hintText: 'Your task',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final todoTitle = _todoController.text;
              if (todoTitle.isNotEmpty) {
                BlocProvider.of<TodoListCubit>(parentContext)
                    .addTodo(todoTitle);
                Navigator.pop(context); // Close the modal
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).primaryColor, // Màu nền là màu chính
              foregroundColor: AppColors.white, // Màu chữ
            ),
            child: const Text('Add Todo'),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
