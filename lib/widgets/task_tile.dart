import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TaskService taskService;
  final Function(String) onDeleteConfirm;

  const TaskTile({
    super.key,
    required this.task,
    required this.taskService,
    required this.onDeleteConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => taskService.toggleTask(task),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () => onDeleteConfirm(task.id),
      ),
      children: [
        ...task.subtasks.map((subtask) {
          return ListTile(
            title: Text(subtask['title'] ?? ''),
            leading: Checkbox(
              value: subtask['isCompleted'] ?? false,
              onChanged: (value) {
                final updatedSubtasks = task.subtasks.map((s) {
                  if (s == subtask) {
                    return {
                      ...s,
                      'isCompleted': value ?? false,
                    };
                  }
                  return s;
                }).toList();
                taskService.updateSubtasks(task.id, updatedSubtasks);
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                final updatedSubtasks =
                    List<Map<String, dynamic>>.from(task.subtasks)
                      ..remove(subtask);
                taskService.updateSubtasks(task.id, updatedSubtasks);
              },
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Add subtask...',
            ),
            onSubmitted: (value) {
              final title = value.trim();
              if (title.isEmpty) return;
              final updatedSubtasks =
                  List<Map<String, dynamic>>.from(task.subtasks)
                    ..add({
                      'title': title,
                      'isCompleted': false,
                    });
              taskService.updateSubtasks(task.id, updatedSubtasks);
            },
          ),
        ),
      ],
    );
  }
}