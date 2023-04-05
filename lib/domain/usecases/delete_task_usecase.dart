import '../repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  Future<void> call(String taskId) async {
    return _taskRepository.deleteTask(taskId);
  }
}
