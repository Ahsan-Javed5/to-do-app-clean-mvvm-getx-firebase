import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/task_model.dart';

class FirebaseTaskRepository implements TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _tasksCollectionRef =
      FirebaseFirestore.instance.collection('tasks');

  @override
  Future<List<Task>> getAllTasks() async {
    final querySnapshot = await _tasksCollectionRef.get();
    return querySnapshot.docs
        .map((doc) => TaskModel.fromDocumentSnapshot(doc))
        .toList();
  }

  @override
  Future<Task> addTask(Task task) async {
    final docRef = await _tasksCollectionRef.add(TaskModel.toMap(task));
    final docSnapshot = await docRef.get();
    return TaskModel.fromDocumentSnapshot(docSnapshot);
  }

  @override
  Future<void> updateTask(Task task) async {
    final docRef = _tasksCollectionRef.doc(task.id);
    await docRef.update(TaskModel.toMap(task));
  }

  @override
  Future<void> deleteTask(String taskId) async {
    final docRef = _tasksCollectionRef.doc(taskId);
    await docRef.delete();
  }
}
