import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  // Declare socket as nullable and initialize it in the constructor
  IO.Socket? socket;

  // Constructor to initialize socket
  SocketService() {
    connect();
  }

  // Method to establish the connection to the WebSocket server
  void connect() {
    // Connecting to the server and initializing the socket
    socket = IO.io('http://<your-server-ip>:5000', IO.OptionBuilder().setTransports(['websocket']).build());

    socket?.on('connect', (_) {
      print('Connected to the server');
    });

    // Handle incoming events from the server
    socket?.on('battleStarted', (data) {
      print('Battle started: $data');
    });

    socket?.on('questionAnswered', (data) {
      print('Question answered: $data');
    });

    socket?.on('battleEnded', (data) {
      print('Battle ended: $data');
    });
  }

  // Method to start the battle
  void startBattle(String player1Id, String player2Id) {
    socket?.emit('startBattle', {'player1Id': player1Id, 'player2Id': player2Id});
  }

  // Method to submit the answer
  void submitAnswer(String matchId, String playerId, bool isCorrect) {
    socket?.emit('submitAnswer', {'matchId': matchId, 'playerId': playerId, 'answerCorrect': isCorrect});
  }

  // Method to end the battle
  void endBattle(String matchId) {
    socket?.emit('endBattle', matchId);
  }
}
