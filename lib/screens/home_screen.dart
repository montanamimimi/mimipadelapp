import 'package:mimipadel/enums/tournament_screen_mode.dart';
// import 'package:mimipadel/models/tournament.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/services/auth.dart';
import 'package:mimipadel/widget/tournament_list.dart';
import 'package:mimipadel/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  
  final HomeController controller;
  final AuthService auth;

  const HomeScreen({
    super.key,    
    required this.controller,
    required this.auth,
    });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  

  Future<void> _load() async {
    await widget.controller.getTournaments();
    
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();   
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image(
                image: AssetImage('assets/images/mimi_logo_xs.png'),
                width: 40.0,
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'MimiPadel Scoring',
                  style: TextStyle(
                    fontFamily: 'IndieFlower'
                  ),              
                  ),
              )
            ],
            ), 
          elevation: 2.0,
          shadowColor: Colors.black,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _load();
            },            
            child: ListView(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0),
              children: [
                Text('Your tournaments'),                  
                TournamentList(
                  controller: widget.controller,
                  callback: () async {
                    await _load();
                  }
                ),
                SizedBox(
                  height: 100.0
                ),
              ]
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(          
          onPressed: () async {                      
            final result = await Navigator.pushNamed(context, '/tournament', arguments: {
                  'id': '',
                  'mode': TournamentScreenMode.create,
            });
            if (result == true) {                      
              _load();
            }
          },
          child: Icon(
            Icons.add,
            size: 50.0,
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Icon (
                  Icons.home_filled
                )
              ),
              ListTile(
                leading: Icon (
                  Icons.person
                ),
                title: Text("Profile"),
                onTap: () {                 
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                }
              )
            ],
          )
        )
      );
  }
}
