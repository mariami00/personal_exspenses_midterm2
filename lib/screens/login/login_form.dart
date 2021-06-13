import 'package:flutter/material.dart';
import 'package:personal_expenses_midterm2/screens/home_screen.dart';
import 'package:personal_expenses_midterm2/widgets/mycontainer.dart';
import 'package:personal_expenses_midterm2/data/database.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(prefixIcon: Icon(Icons.account_box), hintText: "User ID"),
          ),
          SizedBox(
            height: 20.0,
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {
              Database.userID=_textEditingController.text;
              Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(),),);
            },
          ),
        ],
      ),
    );
  }
}
