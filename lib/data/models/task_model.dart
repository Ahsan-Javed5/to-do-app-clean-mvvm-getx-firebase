import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    String id,
    String title,
    String description,
    bool isDone,
  }) : super(
          id: id,
          title: title,
          description: description,
          isDone: isDone,
        );

  factory TaskModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return TaskModel(
      id: snapshot.id,
      title: data['title'] as String,
      description: data['description'] as String,
      isDone: data['isDone'] as bool,
    );
  }

  static Map<String, dynamic> toMap(Task task) {
    return {
      'title': task.title,
      'description': task.description,
      'isDone': task.isDone,
    };
  }
}
