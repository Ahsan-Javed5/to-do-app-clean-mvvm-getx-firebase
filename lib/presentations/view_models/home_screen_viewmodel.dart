import 'package:get/get.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_all_tasks.dart';
import '../../domain/usecases/update_task.dart';
import '../../utils/routes.dart';

class HomeViewModel extends GetxController {
  final GetAllTasks _getAllTasks;
  final UpdateTask _updateTask;
  final DeleteTask _deleteTask;

  HomeViewModel(this._getAllTasks, this._updateTask, this._deleteTask);

  var isLoading = true.obs;
  var taskList = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllTasks();
  }

  Future<void> getAllTasks() async {
    isLoading(true);
    final result = await _getAllTasks();
    result.fold(
      (error) {
        isLoading(false);
        Get.snackbar(
          'Error',
          'Failed to get tasks: ${error.message}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      (tasks) {
        isLoading(false);
        taskList.assignAll(tasks);
      },
    );
  }

  Future<void> updateTask(int index, bool isCompleted) async {
    final task = taskList[index];
    task.isCompleted = isCompleted;
    final result = await _updateTask(task);
    result.fold(
      (error) {
        Get.snackbar(
          'Error',
          'Failed to update task: ${error.message}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      (_) {
        // Do something if necessary
      },
    );
  }

  Future<void> deleteTask(int index) async {
    final task = taskList[index];
    final result = await _deleteTask(task.id);
    result.fold(
      (error) {
        Get.snackbar(
          'Error',
          'Failed to delete task: ${error.message}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      (_) {
        taskList.removeAt(index);
      },
    );
  }
}
