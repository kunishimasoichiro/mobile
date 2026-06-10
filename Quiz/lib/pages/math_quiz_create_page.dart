import 'package:flutter/material.dart';
import '../models/quiz.dart';

class MathQuizCreatePage extends StatefulWidget {
  @override
  State<MathQuizCreatePage> createState() => MathQuizCreatePageState();
}

class MathQuizCreatePageState extends State<MathQuizCreatePage> {
  final questionController = TextEditingController();
  final answerController = TextEditingController(); // 確定された正解用
  final explanationController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    explanationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('数学問題作成（自由記述）')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(
                labelText: '問題（計算式など）',
                hintText: '例: 次の方程式を解け。 x^2 - 5x + 6 = 0',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(
                labelText: '確定された正解',
                hintText: '例: x=2,3',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: explanationController,
              decoration: const InputDecoration(labelText: '解説'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('保存'),
              onPressed: () {
                // 入力が空でないか簡易チェック
                if (questionController.text.isEmpty || answerController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('問題と正解を入力してください')),
                  );
                  return;
                }

                // Quizモデルにデータを格納して元の画面に戻る
                Navigator.pop(
                  context,
                  Quiz(
                    question: questionController.text,
                    // 自由記述の正解をリストの最初の要素として持たせる
                    choices: [answerController.text], 
                    correctIndex: 0, // 自由記述なので0番目を正解と定義
                    explanation: explanationController.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}