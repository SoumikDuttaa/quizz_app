import 'package:flutter/material.dart';
import 'login_page.dart';
import 'socket_service.dart';  // Import the SocketService

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize socket connection when the app starts
    final SocketService socketService = SocketService();
    socketService.connect();

    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginPage(),  // The home page (LoginPage) stays the same
    );
  }
}
