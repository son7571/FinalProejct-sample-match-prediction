import 'package:flutter/material.dart';
import 'package:match_prediction/sample/data/dummy_match_prediction.dart';

import 'widgets/match_prediction_card.dart';

class MatchPredictionSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("승리예측")),
      body: ListView.builder(
        itemCount: dummyMatchList.length,
        itemBuilder: (_, index) => MatchPredictionCard(match: dummyMatchList[index]),
      ),
    );
  }
}
