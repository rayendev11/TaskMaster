import 'package:flutter/material.dart';
import 'package:todo_app_pfa/pages/second_page.dart';
import 'package:todo_app_pfa/pages/socity_role.dart';
/* import 'package:todo_app_pfa/pages/visitor_page.dart'; */

class RoleSelect extends StatelessWidget {
  const RoleSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('role select page'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Mode individuel', style: TextStyle(fontSize: 16,color: Colors.white)),
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
                  MaterialPageRoute(builder: (context) => SocityRole()),
                );
              },
              child: Text('Mode Societe', style: TextStyle(fontSize: 16,color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
