import 'package:flutter/material.dart';

class Manual extends StatefulWidget {
  @override
  _ManualState createState() => _ManualState();
}

class _ManualState extends State<Manual> {
//Explicit



  Widget image2() {
    return Image.asset(
      'images/1.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image3() {
    return Image.asset(
      'images/2.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image4() {
    return Image.asset(
      'images/3.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image5() {
    return Image.asset(
      'images/4.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image6() {
    return Image.asset(
      'images/5.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image7() {
    return Image.asset(
      'images/6.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image8() {
    return Image.asset(
      'images/7.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image9() {
    return Image.asset(
      'images/8.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image10() {
    return Image.asset(
      'images/9.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image11() {
    return Image.asset(
      'images/10.jpg',
      fit: BoxFit.fill,
    );
  }

  Widget image12() {
    return Image.asset(
      'images/11.jpg',
      fit: BoxFit.fill,
    );
  }

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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
            // image: DecorationImage(
            //     image: AssetImage('images/backgrund3.jpg'), fit: BoxFit.cover),
          ),
          child: ListView(
            padding: EdgeInsets.all(50.0),
            children: [
              Column(
                children: [
                  image2(),
                  image3(),
                  image4(),
                  image5(),
                  image6(),
                  image7(),
                  image8(),
                  image9(),
                  image10(),
                  image11(),
                  image12()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
