import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/widget/tournament_list.dart';
import 'package:mimipadel/models/tournament.dart';

class HomeScreen extends StatefulWidget {

  final List<Tournament> tournaments;
  final TournamentRepository repository;

  const HomeScreen({
    super.key,
    required this.tournaments,
    required this.repository,
    });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<Tournament> tournaments;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tournaments = widget.tournaments;    
  }

  Future<void> _deleteData() async {
    await widget.repository.cleanDatabase();
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
                image: AssetImage('assets/images/ball.png'),
                width: 40.0,
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'MimiPadel Scoring',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'IndieFlower'
                  ),              
                  ),
              )
            ],
            ), 
          backgroundColor: Colors.orange[600],
          elevation: 2.0,
          shadowColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                  Text('Your tournaments'),                  
                  TournamentList(
                    tournaments: tournaments,
                    repository: widget.repository,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _deleteData();
                    }, 
                    child: Text("Delete all data")
                  ), 
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('A SnackBar has been shown.')),
                      );
                    },
                    child: const Text('Show SnackBar'),
                  )                  
              ],),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {

            if (index == 0) {
              Navigator.popAndPushNamed(context, '/');
            }

            if (index == 1) {
              Navigator.pushNamed(context, '/profile');
            }

          },
          backgroundColor: Colors.amber,
          elevation: 10.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home
              ),
              label: 'Home',              
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person
              ),
              label: 'Profile'
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(          
          onPressed: () => {
            Navigator.pushNamed(context, '/create') 
          },
          backgroundColor: Colors.orange[400],
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50.0,
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[100],
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
