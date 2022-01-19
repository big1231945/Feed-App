import 'package:flutter/material.dart';

class Sound extends StatefulWidget {
  @override
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<Sound> {
//Explicit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เสียง'),
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
