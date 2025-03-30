import 'package:flutter/material.dart';
import 'pvp_page.dart';
import 'join_chamber_page.dart';
import 'create_chamber_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF795548), // Brown color
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to profile page
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/50'), // Replace with actual profile image
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButtonWithImage('PvP Online', 'lib/assests/1v1.jpg', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PvPPage()),
              );
            }),
            SizedBox(height: 20),
            _buildButtonWithImage('Join Game', 'lib/assests/joinGame.jpg', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinChamberPage()),
              );
            }),
            SizedBox(height: 20),
            _buildButtonWithImage('Create Game', 'lib/assests/createGame.jpg', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateChamberPage()),
              );
            }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Leaderboards page
                  },
                  child: Text(
                    'Leaderboards',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFEB3B), // Yellow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Shop page
                  },
                  child: Text(
                    'Shop',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFEB3B), // Yellow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonWithImage(String text, String imagePath, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: 300,
          height: 200,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
