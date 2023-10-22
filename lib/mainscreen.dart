import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_application/model/model.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_todo_items.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TodoController todoController = Get.put(TodoController());

  Color getColor(Set<MaterialState> states) {
      return Vx.blue700;
    }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Todo List".text.make(),
        centerTitle: true,
        backgroundColor: Vx.blue600,
      ),
      body: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: todoController.tasks.length,
                  itemBuilder: ((context, index) {
                    final task = todoController.tasks[index];
                    return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Vx.gray300,
                            child: Dismissible(
                              key: Key(task.id.toString()), // Unique key for the task
                              background: Container(
                                color: Vx.red800, 
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                              onDismissed: (direction) {
                                // Handle item dismissal (deletion)
                                if (direction == DismissDirection.endToStart) {
                                  // Remove the task when swiped to the left
                                  todoController.removeTask(task.id);
                                }
                              },
                              child: ListTile(
                                leading: Obx(()=> Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.resolveWith(getColor),
                                    value: task.isChecked.value,
                                    onChanged: (bool? value) {
                                      task.toggle();
                                    },
                                  ),
                                ),
                                title: Text(
                                  task.title,
                                  ),
                                subtitle: Text(
                                  task.description,
                                  ),
                                ),
                              ));
                            })
                          );
                        }),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      
                      children: [
                        FloatingActionButton(
                          onPressed: () {Get.to(()=>AddtodoItem(todoController: todoController,transition:Transition.rightToLeftWithFade));},
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.add_task),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
           }
         }
