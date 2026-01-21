import 'package:flutter/material.dart';
import '../models/quiz.dart';//

class QuizCreatePage extends StatefulWidget {
  @override
  State<QuizCreatePage> createState() => QuizCreatePageState();
}

class QuizCreatePageState extends State<QuizCreatePage> {

  final questionController = TextEditingController();
  final explanationController = TextEditingController();

  final List<TextEditingController> choiceControllers =
      List.generate(4, (_) => TextEditingController());

  int selectedCorrectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('クイズ作成')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: '問題'),
            ),
            const SizedBox(height: 10),
            ...List.generate(4, (index) {
              return Row(
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: selectedCorrectIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedCorrectIndex = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: choiceControllers[index],
                      decoration:
                          InputDecoration(labelText: '選択肢 ${index + 1}'),
                    ),
                  ),
                ],
              );
            }),
            TextField(
              controller: explanationController,
              decoration: const InputDecoration(labelText: '解説'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('保存'),
              onPressed: () {
                Navigator.pop(
                  context,
                  Quiz(
                    question: questionController.text,
                    choices:
                        choiceControllers.map((c) => c.text).toList(),
                    correctIndex: selectedCorrectIndex,
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
