class MatchPrediction {
  final String homeTeam;
  final String awayTeam;

  final String homePlayerName;
  final String awayPlayerName;

  final double homeScoreExpected;
  final double awayScoreExpected;

  final String homePlayerImageUrl;
  final String awayPlayerImageUrl;
  final int homePercent;
  final int awayPercent;
  final bool? selected; // true: 홈, false: 원정, null: 미선택

  MatchPrediction({
    required this.homeTeam,
    required this.awayTeam,
    required this.homePlayerName,
    required this.awayPlayerName,
    required this.homePlayerImageUrl,
    required this.awayPlayerImageUrl,
    required this.homePercent,
    required this.awayPercent,
    required this.homeScoreExpected,
    required this.awayScoreExpected,
    this.selected,
  });
}
