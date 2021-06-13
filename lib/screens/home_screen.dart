import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_midterm2/data/database.dart';
import 'package:personal_expenses_midterm2/screens/add_new_screen.dart';
import 'package:personal_expenses_midterm2/widgets/mycontainer.dart';

import 'edit_new_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Database.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Opps! error");
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  String title = snapshot.data!.docs[index].get("title");
                  String docId = snapshot.data!.docs[index].id;
                  String description = snapshot.data!.docs[index].get("description");
                  String amount= snapshot.data!.docs[index].get("amount");
                  return MyContainer(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditScreen(title: title, description: description, amount: amount, docId: docId),),),
                      onLongPress:() => Database.deleteItem(docId: snapshot.data!.docs[index].id),
                      title: Text(title, style: TextStyle(fontSize: 20),),
                      subtitle: Text(description, style: TextStyle(fontSize: 17),),
                      trailing: Text(amount, style: TextStyle(fontSize: 20)),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15,),
                itemCount: snapshot.data!.docs.length);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddNewScreen(),),),
        child: Icon(Icons.add),
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}
