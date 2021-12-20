import 'package:flutter/material.dart';
import 'package:stopwatch/screens/stopwatch.dart';
import 'package:stopwatch/tools/hexToColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = HexColor.fromHex('#141414');
    return MaterialApp(
      title: 'Speed-cubers stopwatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'SanFrancisco',
          scaffoldBackgroundColor: color
      ),
      home: CountUpTimerPage(),
    );
  }
}
