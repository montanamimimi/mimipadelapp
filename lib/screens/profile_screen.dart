import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int counter = 0;
  final TextEditingController _controller = TextEditingController();

  void getCounter() async {
    counter = await Future.delayed(Duration(seconds: 2), () {
      return 10;
    });
  }

  @override
  void initState() {
    super.initState();
    getCounter();
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
                  TextFormField(
                    controller: _controller, 
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Your name")
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty!';
                      }
                    }
                  ),
                  SizedBox(height: 100.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                    radius: 50.0,
                  ),                
                  Divider(
                    height: 10.0,                  
                  ),
                  Text('Counter: $counter'),
                  IconButton(                    
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    }, 
                    icon: Icon(Icons.home),                     
                    )
              ],),
          ),
        ),
        floatingActionButton: FloatingActionButton(          
          onPressed: () => {
            setState(() => counter++)
          },        
          child: Icon(
            Icons.add,
            size: 50.0,
          ),
        ),
      );
  }
}