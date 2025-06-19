import 'package:flutter/material.dart';

import 'sample/match_prediction_sample_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatchPredictionSampleScreen(),
    );
  }
}
