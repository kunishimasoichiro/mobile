import 'package:flutter/material.dart';
import 'package:sample/pages/Quiz_create_Page.dart';
import 'package:sample/pages/Quiz_detail_Page.dart';
import '../models/quiz.dart';

class QuizListPage extends StatefulWidget {
  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  List<Quiz> quizList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('クイズ一覧')),
      body: quizList.isEmpty
          ? const Center(child: Text('クイズがありません'))
          : ListView.builder(
              itemCount: quizList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(quizList[index].question),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            QuizDetailPage(quiz: quizList[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final Quiz? newQuiz = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QuizCreatePage()),
          );

          if (newQuiz != null) {
            setState(() {
              quizList.add(newQuiz);
            });
          }
        },
      ),
    );
  }
}
