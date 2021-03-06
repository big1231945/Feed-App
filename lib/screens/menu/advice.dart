import 'package:flutter/material.dart';

class Advice extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
//Explicit

  Widget image1() {
    return InteractiveViewer(
        child: Image.asset(
      'images/advice.png',
      fit: BoxFit.fill,
    ));
  }

  Widget image2() {
    return InteractiveViewer(
        child: Image.asset(
      'images/A2.png',
      fit: BoxFit.fill,
    ));
  }

  Widget image3() {
    return InteractiveViewer(
        child: Image.asset(
      'images/A3.png',
      fit: BoxFit.fill,
    ));
  }

  Widget image4() {
    return InteractiveViewer(
      child: Image.asset(
        'images/A4.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget image5() {
    return InteractiveViewer(
        child: Image.asset(
      'images/A5.png',
      fit: BoxFit.fill,
    ));
  }

  Widget image6() {
    return InteractiveViewer(
        child: Image.asset(
      'images/A6.png',
      fit: BoxFit.fill,
    ));
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
            children: [
              Column(
                children: [
                  image1(),
                  image2(),
                  image3(),
                  image4(),
                  image5(),
                  image6()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
