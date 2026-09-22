import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mimipadel/models/tournament_format.dart';
import 'package:mimipadel/widget/form_fields/custom_date_form_field.dart';
import 'package:mimipadel/widget/form_fields/custom_text_form_field.dart';
import 'package:mimipadel/widget/form_fields/custom_dropdown_form_field.dart';

class CreateTournamentView extends StatefulWidget {

  final TournamentController controller;
  final ValueChanged<String> onCreate;
  final TournamentFormat format;

  const CreateTournamentView({
    super.key,
    required this.controller,
    required this.onCreate,
    required this.format,
  });

  @override
  State<CreateTournamentView> createState() => _CreateTournamentViewState();
}

class _CreateTournamentViewState extends State<CreateTournamentView> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  int? courts;
  int? points;
  final _formKey = GlobalKey<FormState>();

  DateTime? _tournamentDate;

  Future<void> addTournament() async {

    final String tname = _nameController.text.isNotEmpty ? _nameController.text : "New tournament";
    final DateTime tdate = DateFormat('dd.MM.yyyy').parse(_dateController.text);
    final int tcourts = courts ?? 0;
    final int tpoints = points ?? 0;

    final id = await widget.controller.create(tname, tdate, tcourts, tpoints, widget.format);
    
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tournament created!')),
    );

    widget.onCreate(id);
   
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 12.0,
          children: [
            CustomTextFormField(
              controller: _nameController, 
              label: 'Tournament Name',
              defaultValue: 'New tournament',
            ),
            CustomDateFormField(
              controller: _dateController,
              label: 'Tournament date', 
              callback: () {
                pickTheDate(context);
              }
            ),
            Text("Date: ${_dateController.text}"),
            Text("How many courts to play?"),
            CustomDropdownFormField(
              label: "Courts to play",
              items: [1, 2, 3, 4, 5, 6, 7],
              onChanged: (value) {
                setState(() {
                  courts = value!;
                });
              },
            ),
            CustomDropdownFormField(
              label: "Points to play",
              items: [16, 21, 24, 32],
              onChanged: (value) {
                setState(() {
                  points = value!;
                });
              },
            ),
            if ((points ?? 0) > 0 && (courts ?? 0) > 0) 
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
    );
  }
}