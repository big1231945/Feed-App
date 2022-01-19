import 'package:flutter/material.dart';

class MyStyle{

Color darkColor = Color(0xff009faf);
Color promaryColor = Color(0xff4dd0e1);
Color lightColor = Color(0xff88ffff);

TextStyle darkStyle() => TextStyle(color: darkColor);
TextStyle whiteStyle() => TextStyle(color: Colors.white);
TextStyle activeStyle()=> TextStyle(color: Colors.yellow);


MyStyle();








}

Widget showAppLogo() {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Image.asset('images/icon.png'),
    );
  }


// Future<Null> bigDialog(
//       BuildContext context, String title, String message) async {
//     showDialog(
//       context: context,
//       builder: (context) => SimpleDialog(
//         title: ListTile(
//           leading: showAppLogo(),
//           title: Text(
//             title,
//           ),
//         ),children: [TextBox(onPressed: () =>Navigator.pop(context),child:)],
//       ),
//     );
//   }