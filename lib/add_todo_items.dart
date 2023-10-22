import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:velocity_x/velocity_x.dart';
import '../mainscreen.dart';
import 'model/model.dart';

class AddtodoItem extends StatefulWidget {
  final TodoController todoController;

   const AddtodoItem({required this.todoController, Key? key, required Transition transition}) : super(key: key);
   @override
  State<AddtodoItem> createState() => _AddtodoItemState();
}

class _AddtodoItemState extends State<AddtodoItem> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Todo Items".text.make(),
        centerTitle: true,
        backgroundColor: Vx.blue600,
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: taskTitleController,
              decoration:InputDecoration(hintText: "Enter Task Title...",
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
              ),
              15.heightBox,
              Flexible(
                child: TextField(
                  maxLines: 18,
                  controller: taskDescriptionController,
                decoration:InputDecoration(hintText: "Enter the description here...",
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
                ),
              ),
              10.heightBox,
              ElevatedButton(
              onPressed: () {
                final title = taskTitleController.text;
                final description = taskDescriptionController.text;
                final id = UniqueKey().hashCode;

                if (title.isNotEmpty || description.isNotEmpty) {
                  widget.todoController.addTask(id,title, description);
                   // Close the AddtodoItem screen
                  Get.back();
                 }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Vx.blue700, // Set your desired button color.
                  foregroundColor: Vx.white, // Set your desired text color.
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: "Save Task".text.size(18).make()),
          ],
        ),
      ),
    );
  }
}