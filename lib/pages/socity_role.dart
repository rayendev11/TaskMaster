import 'package:flutter/material.dart';
import 'package:todo_app_pfa/pages/team_membreselect.dart';



class SocityRole extends StatelessWidget {
  const SocityRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('socity role page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //visitor button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                
              },
              child: Text('Scrum master', style: TextStyle(fontSize: 16,color: Colors.white)),
            ),
            SizedBox(height: 40),
            //admin button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeamMembreselect()),
                );
              },
              child: Text('Membre de léquipe ', style: TextStyle(fontSize: 16,color: Colors.white)),
            ),
          ],
        ),
      ),

    );
  }
}