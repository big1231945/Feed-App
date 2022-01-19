import 'package:flutter/material.dart';

class Advice extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
//Explicit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำแนะนำ'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.cyan,
                Colors.indigo,
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.cyan,
      ),
//       appBar: GradientAppBar(
//   title: Text('Flutter Gradient Example'),
//   gradient: LinearGradient(
//     colors: [
//       Colors.cyan,
//       Colors.indigo,
//     ],
//   ),
// ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(50.0),
          children: [],
        ),
      ),
    );
  }
}
