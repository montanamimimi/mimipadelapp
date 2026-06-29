import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:intl/intl.dart';
import 'package:mimipadel/widget/form_fields/custom_date_form_field.dart';
import 'package:mimipadel/widget/form_fields/custom_text_form_field.dart';

class TournamentCreateScreen extends StatefulWidget {

  final TournamentRepository repository;

  const TournamentCreateScreen({
    super.key,
    required this.repository,
  });

  @override
  State<TournamentCreateScreen> createState() => _TournamentCreateScreenState();
}

class _TournamentCreateScreenState extends State<TournamentCreateScreen> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  int? courts;
  final _formKey = GlobalKey<FormState>();

  DateTime? _tournamentDate;

  Future<void> addTournament() async {

    final tournament = Tournament(
      id: 0,
      name: _nameController.text,
      date: DateFormat('dd.MM.yyyy').parse(_dateController.text),
      courts: courts ?? 1,
    );


    final createdTournament = await widget.repository.createTournament(tournament);
    
    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/edit', arguments: createdTournament.id);
   
  }  

  Future<void> pickTheDate(BuildContext context) async {
    final DateTime initialDate = DateTime.now();

    final newDate = await showDatePicker(
      context: context, 
      initialDate: _tournamentDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      builder: (context, child) => Theme(
        data: ThemeData(),
        child: child ?? const Text(''),
      )
    );

    if (newDate == null) {
      return;
    }

    setState(() {
      final String date = DateFormat('dd.MM.yyyy').format(newDate);
      _tournamentDate = newDate;
      _dateController.text = date;
    });
  }

  @override
  void initState() {
    super.initState();

    _dateController.text =
        DateFormat('dd.MM.yyyy').format(DateTime.now());
  }  

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create tournament"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // 
            },
            icon: const Icon(Icons.save),
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 12.0,
            children: [
              CustomTextFormField(controller: _nameController, label: 'Tournament Name'),
              CustomDateFormField(
                controller: _dateController,
                label: 'Tournament date', 
                callback: () {
                  pickTheDate(context);
                }
              ),
              Text("Date: ${_dateController.text}"),
              Text("How many courts to play?"),
              DropdownButtonFormField<int>(                
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Courts',
                ),
                items: [1, 2, 3, 4, 5, 6, 7, 8]
                .map((number) {
                  return DropdownMenuItem(
                    value: number,
                    child: Text(number.toString()),
                  );
                })
                .toList(),    
                onChanged: (value) {
                  setState(() {
                    courts = value!;
                  });                
                }, 
                validator: (value) {
                  if (value == null) {
                    return "Please select courts";
                  }
                  return null;
                },                
              ),
              
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  await addTournament();                
                },
                child: Row (
                  children: [
                    Text("Add players"),
                    Icon(
                      Icons.settings,
                    )
                  ],
                )
              )
            ],
            ),
        )
        ),
    );
  }
}