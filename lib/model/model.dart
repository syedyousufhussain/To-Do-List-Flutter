import 'package:get/get.dart';

class Task {
  var id;
  String title;
  String description;
  final RxBool isChecked;

  Task({required this.id, required this.title,required this.description,bool isChecked = false})
      : isChecked = isChecked.obs; // Initialize with RxBool

  void toggle() {
    isChecked.value = !isChecked.value; // Toggle the value
  }
}


class TodoController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(int id, String title, String description) {
    tasks.add(Task(title:title, description:description, id: id));
  }
  void removeTask(int id) {
    tasks.removeWhere((task) => task.id == id);
  }
}