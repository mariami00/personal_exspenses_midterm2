import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {

  final Widget child;
  const MyContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10.0,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: child,
    );
  }
}
