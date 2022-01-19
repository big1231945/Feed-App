// ignore_for_file: prefer_const_constructors

import 'package:feed_app/screens/menu/advice.dart';
import 'package:feed_app/screens/menu/carmera.dart';
import 'package:feed_app/screens/menu/setting.dart';
import 'package:feed_app/screens/menu/sound.dart';
import 'package:feed_app/screens/menu/start.dart';
import 'package:flutter/material.dart';
import 'package:feed_app/utility/constants.dart';
import 'package:web_socket_channel/io.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    required this.image,
    required this.title,
    required this.country,
    required this.press,
  });

  final String image, title, country;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 3,
        bottom: kDefaultPadding * 0.2,
      ),
      width: size.width * 0.33,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _menuState extends State<menu> {
  // Method
  Widget manu() {
    return RecomendPlantCard(
      image: "images/4185489.png",
      title: "คำแนะนำ",
      country: "คู่มือ",
      press: () {MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Advice());
        Navigator.of(context).push(materialPageRoute);},
    );
  }

  Widget manu2() {
    return RecomendPlantCard(
      image: "images/simple-of-settings-icon-in-flat-style-vector-12816569.png",
      title: "การตั้งค่า",
      country: "ตั้งค่าระบบ",
      press: () {MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Setting());
        Navigator.of(context).push(materialPageRoute);},
    );
  }

  Widget manu3() {
    return RecomendPlantCard(
      image: "images/icon.png",
      title: "ใช้งาน",
      country: "เริ่มการให้อาหาร",
      press: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Start());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget manu4() {
    return RecomendPlantCard(
      image: "images/camera-icon-clipart-transparent.png",
      title: "กล้อง",
      country: "ดูและพูดคุย",
      press: () {MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Carmera(
              channel: IOWebSocketChannel.connect('ws://35.247.189.78:65080'),));
        Navigator.of(context).push(materialPageRoute);},
    );
  }

  Widget manu5() {
    return RecomendPlantCard(
      image: "images/41MF1RKUoFL.png",
      title: "เสียง",
      country: "บันทึกเสียง",
      
      press: () {
        
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Sound());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget manu6() {
    return RecomendPlantCard(
      image: "images/image_1.png",
      title: "อื่นๆ",
      country: "ลฯล",
      press: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu FeedApp'),
          actions: [],
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
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.cyan,
                    Colors.indigo,
                  ],
                )),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [manu(), manu2()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [manu3(), manu4()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [manu5()],
                      )
                    ],
                  ),
                ))));
  }
}
