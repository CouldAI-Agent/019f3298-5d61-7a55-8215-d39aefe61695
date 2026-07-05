class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctOptionIndex;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
  });
}

class Quiz {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });
}

final sampleQuizzes = [
  Quiz(
    id: 'q1',
    title: 'General Knowledge',
    description: 'Test your knowledge on a variety of topics.',
    questions: [
      Question(
        id: '1',
        text: 'What is the capital of France?',
        options: ['London', 'Berlin', 'Paris', 'Madrid'],
        correctOptionIndex: 2,
      ),
      Question(
        id: '2',
        text: 'Which planet is known as the Red Planet?',
        options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        correctOptionIndex: 1,
      ),
      Question(
        id: '3',
        text: 'What is the largest ocean on Earth?',
        options: ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
        correctOptionIndex: 3,
      ),
    ],
  ),
  Quiz(
    id: 'q2',
    title: 'Technology',
    description: 'Questions about computers and programming.',
    questions: [
      Question(
        id: '1',
        text: 'What does HTML stand for?',
        options: ['Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Hyper Tool Markup Language'],
        correctOptionIndex: 0,
      ),
      Question(
        id: '2',
        text: 'Which company developed the Flutter framework?',
        options: ['Apple', 'Microsoft', 'Google', 'Facebook'],
        correctOptionIndex: 2,
      ),
    ],
  ),
];
