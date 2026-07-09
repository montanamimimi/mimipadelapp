import 'package:flutter/material.dart';
import 'package:mimipadel/enums/tournament_screen_mode.dart';
import 'package:mimipadel/models/tournament.dart';

class TournamentItem extends StatelessWidget {

  const TournamentItem({
    super.key, 
    required this.tournament,
    required this.callback,
  });

  final Tournament tournament;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),      
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 255, 228),
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 80, 100, 84),
        ),
        borderRadius: BorderRadius.circular(12),
      ),      
      child: InkWell(
        onTap: () async {   
            
          if (tournament.started) {
            final result1 = await Navigator.pushNamed(context, '/tournament', arguments: {
              'id': tournament.id,
              'mode': TournamentScreenMode.play,
            });


            if (result1 == true) {                      
              callback();
            }    
          } else {
            final result2 = await  Navigator.pushNamed(context, '/tournament', arguments: {
              'id': tournament.id,
              'mode': TournamentScreenMode.edit,
            }); 

            if (result2 == true) {                      
              callback();
            }            
          }    
        },
        child: Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tournament.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              )
            ),
            Text(tournament.getDate()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [                                
                Text('Courts: ${tournament.courts} '),
                Text('Points to play: ${tournament.points}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
