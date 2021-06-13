import 'package:flutter/material.dart';
import 'package:personal_expenses_midterm2/data/database.dart';
import 'package:personal_expenses_midterm2/widgets/mycontainer.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({Key? key}) : super(key: key);

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyContainer(
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'please enter title'),
                ),
              ),
              SizedBox(height: 20,),
              MyContainer(
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'please enter description'),
                ),
              ),
              SizedBox(height: 20,),
              MyContainer(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(hintText: 'please enter amount'),
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Database.addItem(title: _titleController.text, description: _descriptionController.text, amount: _amountController.text);
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
