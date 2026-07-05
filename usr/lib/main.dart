import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizHomeScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question(this.text, this.options, this.correctIndex);
}

final List<Question> sampleQuestions = [
  Question('What is Flutter?', ['A bird', 'An SDK by Google', 'A food', 'A car'], 1),
  Question('What language does Flutter use?', ['Java', 'Kotlin', 'Dart', 'Swift'], 2),
  Question('Is Flutter for Web supported?', ['Yes', 'No', 'Only in beta', 'Coming soon'], 0),
];

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Flutter Quiz!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/quiz'),
              child: const Text('Start Quiz'),
            )
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == sampleQuestions[currentQuestionIndex].correctIndex) {
      score++;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= sampleQuestions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Finished')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Score: $score / ${sampleQuestions.length}', style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                child: const Text('Restart'),
              )
            ],
          ),
        ),
      );
    }

    final question = sampleQuestions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Question ${currentQuestionIndex + 1}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.text,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ...List.generate(question.options.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                    onPressed: () => answerQuestion(index),
                    child: Text(question.options[index]),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
