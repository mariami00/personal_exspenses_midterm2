import 'package:flutter/material.dart';
import 'package:personal_expenses_midterm2/data/database.dart';
import 'package:personal_expenses_midterm2/widgets/mycontainer.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key, required this.title, required this.description, required this.amount, required this.docId}) : super(key: key);

  final String title;
  final String description;
  final String amount;
  final String docId;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
    _amountController = TextEditingController(text: widget.amount);
  }

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
              SizedBox(height: 20.0,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: TextButton(
                  onPressed: () {
                    Database.updateItem(title: _titleController.text, description: _descriptionController.text, amount: _amountController.text, docId: widget.docId);
                    Navigator.pop(context);
                  },
                  child: Text("Edit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
