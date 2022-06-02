import 'package:flutter/material.dart';

class BasicAttributes extends StatefulWidget {
  const BasicAttributes({Key? key}) : super(key: key);

  @override
  State<BasicAttributes> createState() => _BasicAttributesState();
}

class _BasicAttributesState extends State<BasicAttributes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 16.0,
            alignment: WrapAlignment.center,
            children: const <Widget>[
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+5 Força',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Breathe Fire III',
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+8 Destreza',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+1 Constituição',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+4 Inteligêcia',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+3 Sabedoria',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+2 Carisma',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
