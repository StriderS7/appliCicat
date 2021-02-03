import 'package:flutter/material.dart';

class FilterDialogue extends StatefulWidget {
  @override
  _FilterDialogueState createState() => _FilterDialogueState();
}

class _FilterDialogueState extends State<FilterDialogue> {
  bool pressed = true;
  List<bool> selected = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        FlatButton(
          color: selected[0] ? null : Colors.blue,
          onPressed: () => setState(() => this.selected[0] = !this.selected[0]),
          child: Text(
            'Médecins déjà consultés',
            style: selected[0]
                ? TextStyle(color: Colors.grey)
                : TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selected[0] ? Colors.grey : Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          color: selected[1] ? null : Colors.blue,
          onPressed: () => setState(() => this.selected[1] = !this.selected[1]),
          child: Text(
            'Médecins à proximité',
            style: selected[1]
                ? TextStyle(color: Colors.grey)
                : TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selected[1] ? Colors.grey : Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          color: selected[2] ? null : Colors.blue,
          onPressed: () => setState(() => this.selected[2] = !this.selected[2]),
          child: Text(
            'Hôpitaux',
            style: selected[2]
                ? TextStyle(color: Colors.grey)
                : TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selected[2] ? Colors.grey : Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          color: selected[3] ? null : Colors.blue,
          onPressed: () => setState(() => this.selected[3] = !this.selected[3]),
          child: Text(
            'CHU',
            style: selected[3]
                ? TextStyle(color: Colors.grey)
                : TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selected[3] ? Colors.grey : Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          color: selected[4] ? null : Colors.blue,
          onPressed: () => setState(() => this.selected[4] = !this.selected[4]),
          child: Text(
            'Cliniques',
            style: selected[4]
                ? TextStyle(color: Colors.grey)
                : TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selected[4] ? Colors.grey : Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
