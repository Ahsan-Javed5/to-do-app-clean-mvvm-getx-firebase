import 'package:get/get.dart';

import '../../data/models/task.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task_usecase.dart';

class AddTaskViewModel extends GetxController {
  final AddTaskUseCase _addTaskUseCase;

  String taskName = '';

  AddTaskViewModel(this._addTaskUseCase);

  void addTask() async {
    final newTask = Task(name: taskName, isCompleted: false);
    await _addTaskUseCase.execute(newTask);
  }
}
