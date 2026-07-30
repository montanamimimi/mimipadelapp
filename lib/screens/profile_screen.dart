import 'package:flutter/material.dart';
import 'package:mimipadel/controllers/home_controller.dart';
import 'package:mimipadel/models/mimi_user.dart';
import 'package:mimipadel/screens/loading_screen.dart';
import 'package:mimipadel/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final AuthService _auth = AuthService();
  late User user;  

  void _getUser() {
    setState(() {
      user = _auth.currentUser();      
    });

    print(user);
  }

  @override
  void initState() {
    super.initState();
    print('init');
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
                'Edit profile',
                style: TextStyle(
                color: Colors.white,
                fontFamily: 'IndieFlower'
              ),              
            ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [

                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                    radius: 50.0,
                  ),         
                  Text('User id ${user.uid}'),    
                  ElevatedButton(
                    onPressed: () async {
                      await _auth.signOut();
                      if (!context.mounted) return;
                      Navigator.pushReplacementNamed(context, '/');                             
                    }, 
                    child: Text('Sign Out')
                  )
              ],),
          ),
        ),
      );
  }
}