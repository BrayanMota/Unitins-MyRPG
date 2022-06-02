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
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 16.0,
            alignment: WrapAlignment.center,
            children: <Widget>[
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
                  '+15 Destreza',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+12 Constituição',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+8 Inteligêcia',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+16 Sabedoria',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  '+9 Carisma',
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
