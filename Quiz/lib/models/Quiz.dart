class Quiz {
  final String question;
  final List<String> choices;
  final int correctIndex;
  final String explanation;

  Quiz({
    required this.question,
    required this.choices,
    required this.correctIndex,
    required this.explanation,
  });
}
