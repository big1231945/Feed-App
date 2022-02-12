// // import 'package:flutter/material.dart';
// // import 'package:web_socket_channel/io.dart';
// // import 'package:web_socket_channel/web_socket_channel.dart';
// // class Carmera extends StatefulWidget {
// //   @override
// //   _CarmeraState createState() => _CarmeraState();
// // }

// // class _CarmeraState extends State<Carmera> {
// // //Explicit

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('กล้อง'),
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               begin: Alignment.centerLeft,
// //               end: Alignment.centerRight,
// //               colors: <Color>[
// //                 Colors.cyan,
// //                 Colors.indigo,
// //               ],
// //             ),
// //           ),
// //         ),
// //         // backgroundColor: Colors.cyan,
// //       ),
// // //       appBar: GradientAppBar(
// // //   title: Text('Flutter Gradient Example'),
// // //   gradient: LinearGradient(
// // //     colors: [
// // //       Colors.cyan,
// // //       Colors.indigo,
// // //     ],
// // //   ),
// // // ),
// //       body: Form(
// //         child: ListView(
// //           padding: EdgeInsets.all(50.0),
// //           children: [],
// //         ),
// //       ),
// //     );
// //   }
// // }







// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:intl/intl.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';



class Carmera extends StatefulWidget {
  final WebSocketChannel channel;
  
  Carmera({required this.channel});

  @override
  _CarmeraState createState() => _CarmeraState();
}

class _CarmeraState extends State<Carmera> {
  final double videoWidth = 640;
  final double videoHeight = 480;

  double newVideoSizeWidth = 640;
  double newVideoSizeHeight = 480;

  late bool isLandscape;
  late String _timeString;

  var _globalKey = new GlobalKey();
  

  @override
  void initState() {
    super.initState();
    isLandscape = false;

    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        var screenWidth = MediaQuery.of(context).size.width;
        var screenHeight = MediaQuery.of(context).size.height;

        if (orientation == Orientation.portrait) {
          //screenWidth < screenHeight

          isLandscape = false;
          newVideoSizeWidth =
              screenWidth > videoWidth ? videoWidth : screenWidth;
          newVideoSizeHeight = videoHeight * newVideoSizeWidth / videoWidth;
        } else {
          isLandscape = true;
          newVideoSizeHeight =
              screenHeight > videoHeight ? videoHeight : screenHeight;
          newVideoSizeWidth = videoWidth * newVideoSizeHeight / videoHeight;
        }

        return 
        Container(
          color: Colors.black,
          child: StreamBuilder(
            stream: widget.channel.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: isLandscape ? 0 : 30,
                        ),
                        Stack(
                          children: <Widget>[
                            RepaintBoundary(
                              key: _globalKey,
                              child: GestureZoomBox(
                                maxScale: 5.0,
                                doubleTapScale: 2.0,
                                duration: Duration(milliseconds: 200),
                                child: 
                                Image.memory(
                                  snapshot.data,
                                  gaplessPlayback: true,
                                  width: newVideoSizeWidth,
                                  height: newVideoSizeHeight,
                                ),
                              ),
                            ),
                            Positioned.fill(
                                child: Align(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'กล้องดูแมว',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Live | $_timeString',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              alignment: Alignment.topCenter,
                            ))
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.cyan[200],
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  // IconButton(
                                  //     icon: Icon(
                                  //   Icons.videocam,
                                  //   size: 24,
                                  // ),
                                  //   onPressed: takeScreenShot,),
                                  // IconButton(
                                  //   icon: Icon(
                                  //     Icons.photo_camera,
                                  //     size: 24,
                                  //   ),
                                  //   onPressed: takeScreenShot,
                                  // ),
                                  // IconButton(
                                  //     icon: Icon(
                                  //   Icons.mic,
                                  //   size: 24,
                                  // ),
                                  //   onPressed: takeScreenShot,),
                                  // IconButton(
                                  //     icon: Icon(
                                  //   Icons.speaker,
                                  //   size: 24,
                                  // ),
                                  //   onPressed: takeScreenShot,),
                                  // IconButton(
                                  //     icon: Icon(
                                  //   Icons.add_alert,
                                  //   size: 24,
                                  // ),
                                  //   onPressed: takeScreenShot,)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        );
      }),
      floatingActionButton: _getFab(),
    );
  }

  takeScreenShot() async {
    RenderRepaintBoundary? boundary =
        _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    var image = await boundary?.toImage();
    var byteData = await image?.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();
    

    Fluttertoast.showToast(
       
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0, msg: '');
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd hh:mm:ss aaa').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _timeString = _formatDateTime(now);
    });
  }

  Widget _getFab() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      visible: isLandscape,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.photo_camera),
          onTap: takeScreenShot,
        ),
        SpeedDialChild(child: Icon(Icons.videocam), onTap: () {})
      ],
    );
  }
}