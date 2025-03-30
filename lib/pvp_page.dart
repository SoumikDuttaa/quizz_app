import 'package:flutter/material.dart';

class PvPPage extends StatefulWidget {
  @override
  _PvPPageState createState() => _PvPPageState();
}

class _PvPPageState extends State<PvPPage> {
  bool _quizStarted = false;
  int _questionIndex = 0;
  int _totalScore = 0;
  bool _buzzerPressed = false;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is Harry Potter\'s Patronus?',
      'answers': [
        {'text': 'Stag', 'score': 10},
        {'text': 'Otter', 'score': 0},
        {'text': 'Dog', 'score': 0},
        {'text': 'Phoenix', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the name of Voldemort\'s snake?',
      'answers': [
        {'text': 'Nagini', 'score': 10},
        {'text': 'Basilisk', 'score': 0},
        {'text': 'Crookshanks', 'score': 0},
        {'text': 'Hedwig', 'score': 0},
      ],
    },
    // More questions can be added here
  ];

  void _answerQuestion(int score) {
    if (!_buzzerPressed) return; // Prevent answering before buzzer press
    _totalScore += score;
    setState(() {
      _questionIndex = (_questionIndex + 1) % _questions.length;
      _buzzerPressed = false; // Reset buzzer flag for next question
    });
  }

  void _buzzerPressedFunc() {
    setState(() {
      _buzzerPressed = true;  // Enable answering when buzzer is pressed
    });
  }

  List<Widget> _buildAnswerButtons() {
    List<Widget> buttons = [];
    for (var answer in (_questions[_questionIndex]['answers'] as List<Map<String, Object>>)) {
      buttons.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton(
            onPressed: _buzzerPressed ? () => _answerQuestion(answer['score'] as int) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.8),
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              textStyle: TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(answer['text'] as String),
          ),
        ),
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter PvP Quiz'),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/assests/bgGame.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Initial UI
          if (!_quizStarted)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Difficulty: Easy',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _quizStarted = true;
                      });
                    },
                    child: Text('START'),
                  ),
                ],
              ),
            ),

          // Quiz UI
          if (_quizStarted)
            _questionIndex < _questions.length
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            _questions[_questionIndex]['questionText'] as String,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      if (_buzzerPressed)
                        Text(
                          "Buzzer Pressed! Answer Now!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      // Align answers to the left
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: _buildAnswerButtons(),
                        ),
                      ),
                      Spacer(),

                      // Positioned BUZZ button at bottom-right
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: _buzzerPressedFunc,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(32),
                            ),
                            child: Text('BUZZ'),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Quiz completed! Your score: $_totalScore',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
