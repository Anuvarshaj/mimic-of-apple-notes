import 'package:flutter/material.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apple Notes Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow[700],
        scaffoldBackgroundColor: Colors.yellow[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[700],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: NotesHome(),
    );
  }
}

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  List<String> notes = [];
  TextEditingController noteController = TextEditingController();

  void addNote() {
    if (noteController.text.isNotEmpty) {
      setState(() {
        notes.add(noteController.text);
        noteController.clear();
      });
    }
  }

  void deleteNoteAt(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void editNoteAt(int index) {
    noteController.text = notes[index];
    deleteNoteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: noteController,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.yellow[50],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Write a note...',
                hintStyle: TextStyle(color: Colors.black54),
              ),
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow[200],
                  child: ListTile(
                    title: Text(
                      notes[index],
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () => editNoteAt(index),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () => deleteNoteAt(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
        onPressed: addNote,
        child: Icon(Icons.add),
      ),
    );
  }
}




