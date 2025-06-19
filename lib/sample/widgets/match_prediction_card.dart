import 'package:flutter/material.dart';
import 'package:match_prediction/sample/model/match_prediction_model.dart';

class MatchPredictionCard extends StatelessWidget {
  final MatchPrediction match;

  const MatchPredictionCard({required this.match});

  @override
  Widget build(BuildContext context) {
    final double totalScore = match.homeScoreExpected + match.awayScoreExpected;
    final double widthFactor = totalScore == 0 ? 0.5 : match.homeScoreExpected / totalScore;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 팀 정보
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      _teamColumn(context, match.homeTeam, match.homePlayerImageUrl, match.homePlayerName),
                      MatchRecordButton(match: match, teamName: match.homeTeam),
                    ],
                  ),
                ),
                Text("VS"),
                Flexible(
                  child: Column(
                    children: [
                      _teamColumn(context, match.awayTeam, match.awayPlayerImageUrl, match.awayPlayerName),
                      MatchRecordButton(match: match, teamName: match.awayTeam),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("예상득점", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(
                  "양팀 득점 합계 ${totalScore.toStringAsFixed(1)}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 예상득점 퍼센트 바
            _buildPercentageBar(
              context,
              widthFactor,
              match.homeScoreExpected.toStringAsFixed(1),
              match.awayScoreExpected.toStringAsFixed(1),
            ),
            const SizedBox(height: 10),

            Row(
              children: [Text("승리확률", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))],
            ),
            const SizedBox(height: 10),

            // 승리확률 퍼센트 바
            _buildPercentageBar(
              context,
              match.homePercent / 100,
              match.homePercent.toStringAsFixed(1),
              match.awayPercent.toStringAsFixed(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentageBar(
    BuildContext context,
    double widthFactor,
    String leftText,
    String rightText,
  ) {
    return Stack(
      children: [
        Container(
          height: 28,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            rightText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: widthFactor.clamp(0.0, 1.0),
          child: Container(
            height: 28,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              leftText,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _teamColumn(BuildContext context, String team, String logoUrl, String name) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = screenWidth * 0.22;
    final double imageHeight = imageWidth * 1.2;

    return Column(
      children: [
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              logoUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text("이미지 없음"));
              },
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(team, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
      ],
    );
  }
}

class MatchRecordButton extends StatelessWidget {
  const MatchRecordButton({
    super.key,
    required this.match,
    required this.teamName,
  });

  final MatchPrediction match;
  final String teamName;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08,
          vertical: 14,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text("$teamName 전적 확인", style: TextStyle(fontSize: 13)),
    );
  }
}
