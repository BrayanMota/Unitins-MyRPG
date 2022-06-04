import 'package:flutter/material.dart';
import 'package:my_rpg/character/shared/attribute_model.dart';

class BasicAttribute extends StatefulWidget {
  BasicAttribute({Key? key, required this.attributeModel}) : super(key: key);

  AttributeModel attributeModel;

  @override
  State<BasicAttribute> createState() => _BasicAttributeState();
}

class _BasicAttributeState extends State<BasicAttribute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Card(
        elevation: 6,
        child: InkWell(
          splashColor: Colors.black45,
          onTap: _loadAttributeDetails,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget.attributeModel.name,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                "+ ${widget.attributeModel.bonus.toString()}",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.attributeModel.value.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadAttributeDetails() async {
    String _currentAttributeValue = widget.attributeModel.value.toString();

    void _incrementAttributeValue() {
      setState(() {
        widget.attributeModel.value++;
        _currentAttributeValue = widget.attributeModel.value.toString();
      });
    }

    void _decrementAttributeValue() {
      setState(() {
        widget.attributeModel.value--;
        _currentAttributeValue = widget.attributeModel.value.toString();
      });
    }

    switch (await showDialog<BasicAttribute>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Text(
              widget.attributeModel.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    child: const Icon(Icons.remove),
                    backgroundColor: Colors.blueAccent,
                    onPressed: _decrementAttributeValue,
                  ),
                  Text(
                    _currentAttributeValue,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.blueAccent,
                    onPressed: _incrementAttributeValue,
                  )
                ],
              )
            ]);
      },
    )) {
    }
  }
}
