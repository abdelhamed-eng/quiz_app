class QuizQuestion {
  const QuizQuestion(
    this.question,
    this.text,
  );
  final String question;
  final List<String> text;

  List<String> getShuffledAnswers() {
    final shuffled = List.of(text);
    shuffled.shuffle();
    return shuffled;
  }
}