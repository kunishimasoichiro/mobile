import 'package:flutter/material.dart';
import '../models/quiz.dart';

class QuizDetailPage extends StatefulWidget {
  final Quiz quiz;
  const QuizDetailPage({super.key, required this.quiz});

  @override
  State<QuizDetailPage> createState() => _QuizDetailPageState();
}

class _QuizDetailPageState extends State<QuizDetailPage> {
  int? selectedAnswer;
  bool isAnswered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('クイズ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.quiz.question,
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ...List.generate(widget.quiz.choices.length, (index) {
              return RadioListTile<int>(
                title: Text(widget.quiz.choices[index]),
                value: index,
                groupValue: selectedAnswer,
                onChanged: isAnswered
                    ? null
                    : (value) {
                        setState(() {
                          selectedAnswer = value;
                        });
                      },
              );
            }),
            ElevatedButton(
              onPressed: selectedAnswer == null || isAnswered
                  ? null
                  : () {
                      setState(() {
                        isAnswered = true;
                      });
                    },
              child: const Text('回答する'),
            ),
            if (isAnswered) _buildResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    final isCorrect = selectedAnswer == widget.quiz.correctIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isCorrect ? '⭕ 正解！' : '❌ 不正解',
          style: TextStyle(
              fontSize: 20,
              color: isCorrect ? Colors.green : Colors.red),
        ),
        Text('正解：${widget.quiz.choices[widget.quiz.correctIndex]}'),
        Text('解説：${widget.quiz.explanation}'),
      ],
    );
  }
}
