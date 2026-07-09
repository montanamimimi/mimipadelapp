import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/enums/tournament_screen_mode.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/widget/tournament_list.dart';
import 'package:mimipadel/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  
  final HomeController controller;

  const HomeScreen({
    super.key,    
    required this.controller,
    });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Tournament> tournaments = [];
  int currentIndex = 0;

  Future<void> _load() async {
    await widget.controller.getTournaments();
    setState(() {
      tournaments = widget.controller.tournaments;
    });
  }

  @override
  void initState() {
    super.initState();   
    _load();
  }

  Future<void> _deleteData() async {
    await widget.controller.deleteAllData();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
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
                ElevatedButton(
                  onPressed: () async {
                    await _deleteData();
                  }, 
                  child: Text("Delete all data (!)")
                ),
              ]
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(         
        //   onTap: (index) {
        //     if (index == 1) {
        //       Navigator.pushNamed(context, '/profile');
        //     }
        //   },
        //   backgroundColor: Colors.green[100],
        //   elevation: 10.0,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home
        //       ),
        //       label: 'Home',              
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.person
        //       ),
        //       label: 'Profile'
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(          
          onPressed: () async {                      
            final result = await Navigator.pushNamed(context, '/tournament', arguments: {
                  'id': 0,
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
