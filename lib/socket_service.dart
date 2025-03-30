import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket socket;

  void connect() {
    socket = IO.io('http://<your-server-ip>:5000', IO.OptionBuilder().setTransports(['websocket']).build());

    socket.on('connect', (_) {
      print('Connected to the server');
    });

    // Handle events from the server
    socket.on('battleStarted', (data) {
      print('Battle started: $data');
    });

    socket.on('questionAnswered', (data) {
      print('Question answered: $data');
    });

    socket.on('battleEnded', (data) {
      print('Battle ended: $data');
    });
  }

  void startBattle(String player1Id, String player2Id) {
    socket.emit('startBattle', {'player1Id': player1Id, 'player2Id': player2Id});
  }

  void submitAnswer(String matchId, String playerId, bool isCorrect) {
    socket.emit('submitAnswer', {'matchId': matchId, 'playerId': playerId, 'answerCorrect': isCorrect});
  }

  void endBattle(String matchId) {
    socket.emit('endBattle', matchId);
  }
}
