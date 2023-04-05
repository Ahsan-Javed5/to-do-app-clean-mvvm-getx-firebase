import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/home_screen_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: SafeArea(
        child: Obx(() {
          if (viewModel.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.taskList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(viewModel.taskList[index].title),
                  subtitle: Text(viewModel.taskList[index].description),
                  trailing: Checkbox(
                    value: viewModel.taskList[index].isCompleted,
                    onChanged: (value) {
                      viewModel.updateTask(index, value!);
                    },
                  ),
                  onTap: () {
                    Get.toNamed('/edit_task', arguments: index);
                  },
                );
              },
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add_task');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
