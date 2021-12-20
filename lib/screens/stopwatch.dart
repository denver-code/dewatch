// import "package:flutter/material.dart";
// import 'package:stop_watch_timer/stop_watch_timer.dart';
//
//
// class StopWatchScreen extends StatefulWidget {
//   const StopWatchScreen({Key? key}) : super(key: key);
//
//   @override
//   _StopWatchScreenState createState() => _StopWatchScreenState();
// }
//
// class _StopWatchScreenState extends State<StopWatchScreen> {
//
//
//
//
//
//
//
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 45, fontWeight: FontWeight.w300, color: Colors.white);
//
//   static final List<Widget> _widgetOptions = <Widget>[
//     Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         /// Display stop watch time
//         Padding(
//           padding: const EdgeInsets.only(bottom: 0),
//           child: StreamBuilder<int>(
//             stream: _stopWatchTimer.rawTime,
//             initialData: _stopWatchTimer.rawTime.value,
//             builder: (context, snap) {
//               final value = snap.data!;
//               final displayTime =
//               StopWatchTimer.getDisplayTime(value, hours: _isHours);
//               return Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Text(((){
//                       if (value < 1000){
//                         return value.toString();
//                       } else{
//                         return _putDot(value.toString());
//                       }
//                     }()),
//                       style: const TextStyle(
//                           fontSize: 60,
//                           fontFamily: 'SanFrancisco',
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//         // Padding(
//         //   padding: const EdgeInsets.all(2),
//         //   child: Column(
//         //     children: <Widget>[
//         //       Padding(
//         //         padding: const EdgeInsets.only(bottom: 0),
//         //         child: Row(
//         //           mainAxisAlignment: MainAxisAlignment.center,
//         //           children: <Widget>[
//         //             Padding(
//         //               padding: const EdgeInsets.symmetric(horizontal: 4),
//         //               child: RaisedButton(
//         //                 padding: const EdgeInsets.all(4),
//         //                 color: Colors.lightBlue,
//         //                 shape: const StadiumBorder(),
//         //                 onPressed: () async {
//         //                   _stopWatchTimer.onExecute
//         //                       .add(StopWatchExecute.start);
//         //                 },
//         //                 child: const Text(
//         //                   'Start',
//         //                   style: TextStyle(color: Colors.white),
//         //                 ),
//         //               ),
//         //             ),
//         //             Padding(
//         //               padding: const EdgeInsets.symmetric(horizontal: 4),
//         //               child: RaisedButton(
//         //                 padding: const EdgeInsets.all(4),
//         //                 color: Colors.green,
//         //                 shape: const StadiumBorder(),
//         //                 onPressed: () async {
//         //                   _stopWatchTimer.onExecute
//         //                       .add(StopWatchExecute.stop);
//         //                 },
//         //                 child: const Text(
//         //                   'Stop',
//         //                   style: TextStyle(color: Colors.white),
//         //                 ),
//         //               ),
//         //             ),
//         //             Padding(
//         //               padding: const EdgeInsets.symmetric(horizontal: 4),
//         //               child: RaisedButton(
//         //                 padding: const EdgeInsets.all(4),
//         //                 color: Colors.red,
//         //                 shape: const StadiumBorder(),
//         //                 onPressed: () async {
//         //                   _stopWatchTimer.onExecute
//         //                       .add(StopWatchExecute.reset);
//         //                 },
//         //                 child: const Text(
//         //                   'Reset',
//         //                   style: TextStyle(color: Colors.white),
//         //                 ),
//         //               ),
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // )
//       ],
//     ),
//
//     Text(
//       'Index 1: Scores',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Educate',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 3: Settings',
//       style: optionStyle,
//     ),
//   ];
//
//
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//           onTap: () => print("tapped"),
//           child: Container(child: _widgetOptions.elementAt(_selectedIndex),
//           height : MediaQuery.of(context).size.height,
//           width : MediaQuery.of(context).size.width,
//           ),
//         ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black12,
//             icon: Icon(Icons.timer),
//             label: 'Time',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black12,
//             icon: Icon(Icons.leaderboard),
//             label: 'Scores',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black12,
//             icon: Icon(Icons.school),
//             label: 'Educate',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black12,
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         type: BottomNavigationBarType.shifting,
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blueAccent,
//         unselectedItemColor: Colors.white10,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
//
// }


import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CountUpTimerPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => CountUpTimerPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<CountUpTimerPage> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();
  late bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));

  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  void _toogleCoutDown(){
    print("Contact!!!");
    if (!_isActive){
      _stopWatchTimer.onExecute
          .add(StopWatchExecute.start);
      _isActive = true;
    } else{
      _stopWatchTimer.onExecute
          .add(StopWatchExecute.stop);
      _isActive = false;
    }
  }
  // U2 B2 L D2 R' U2  F2 L R' U2 R' D' B2 F2 L' D L' U B R' F'
  String _putDot(num) {
    List<String> mylist = [];
    mylist = num.split("");
    mylist.insert(mylist.length-3, ".");
    // mylist.removeAt(mylist.length-1);
    var concatenate = StringBuffer();
    for (var item in mylist) {
      concatenate.write(item);
    }
    return concatenate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toogleCoutDown,
        onLongPress: () async {
          _stopWatchTimer.onExecute
              .add(StopWatchExecute.reset);
        },
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// Display stop watch time
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data!;
                  final displayTime =
                  StopWatchTimer.getDisplayTime(value, hours: _isHours);
                  return Column(
                    children: <Widget>[
                      Text("U2 B2 L D2 R' U2  F2 L R' U2 R' D' B2 F2 L' D L' U B R' F'", style: TextStyle(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(((){
                          if (value == 0){
                            return "Ready";
                          } else if(value < 1000){
                            return value.toString();
                          }else{
                            return _putDot(value.toString());
                          }
                        }()),
                          style: const TextStyle(
                              fontSize: 60,
                              fontFamily: 'SanFrancisco',
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),


            /// Button
            // Padding(
            //   padding: const EdgeInsets.all(2),
            //   child: Column(
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.only(bottom: 0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 4),
            //               child: RaisedButton(
            //                 padding: const EdgeInsets.all(4),
            //                 color: Colors.lightBlue,
            //                 shape: const StadiumBorder(),
            //                 onPressed: () async {
            //                   _stopWatchTimer.onExecute
            //                       .add(StopWatchExecute.start);
            //                 },
            //                 child: const Text(
            //                   'Start',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 4),
            //               child: RaisedButton(
            //                 padding: const EdgeInsets.all(4),
            //                 color: Colors.green,
            //                 shape: const StadiumBorder(),
            //                 onPressed: () async {
            //                   _stopWatchTimer.onExecute
            //                       .add(StopWatchExecute.stop);
            //                 },
            //                 child: const Text(
            //                   'Stop',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 4),
            //               child: RaisedButton(
            //                 padding: const EdgeInsets.all(4),
            //                 color: Colors.red,
            //                 shape: const StadiumBorder(),
            //                 onPressed: () async {
            //                   _stopWatchTimer.onExecute
            //                       .add(StopWatchExecute.reset);
            //                 },
            //                 child: const Text(
            //                   'Reset',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //
            //
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      ),
    );
  }
}