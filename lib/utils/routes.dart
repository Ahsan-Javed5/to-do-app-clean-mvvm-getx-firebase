import 'package:get/get.dart';
import '../bindings/add_task_binding.dart';
import '/bindings/home_binding.dart';
import '/presentations/screens/home_screen.dart';

class Routes {
  static const home = '/home';
  static const addTask = '/addTask';

  static final pages = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: addTask,
      page: () => AddTaskScreen(),
      binding: AddTaskBinding(),
    ),
  ];
}
