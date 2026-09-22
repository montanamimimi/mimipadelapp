import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {

    const PlayerItem({
      super.key, 
      required this.name,
      required this.rating,
    });

    final String name;
    final int rating;

    @override
    Widget build(BuildContext context) {          
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0, 
          horizontal: 8.0
        ),
        child: Row(        
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              
              Text(
                name, 
                style: TextStyle(
                  fontSize: 18.0,
                )
              ),
              Text(
                rating.toString()
              ),
            ],
          ),
      );
    }
}