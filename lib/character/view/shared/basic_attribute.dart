import 'package:flutter/material.dart';
import 'package:my_rpg/character/model/attribute_model.dart';

class BasicAttribute extends StatefulWidget {
  BasicAttribute({Key? key, required this.attributeModel}) : super(key: key);

  AttributeModel attributeModel;

  @override
  State<BasicAttribute> createState() => _BasicAttributeState();
}

class _BasicAttributeState extends State<BasicAttribute> {
  late ValueNotifier<int> _currentAttributeValue;

  @override
  initState() {
    super.initState();
    _currentAttributeValue = ValueNotifier<int>(widget.attributeModel.value);
  }

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
                "+ ${widget.attributeModel.bonus}",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              AttributeDetails(
                counterValueNotifier: _currentAttributeValue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadAttributeDetails() async {
    void _incrementAttributeValue() {
      setState(() {
        _currentAttributeValue.value++;
      });
    }

    void _decrementAttributeValue() {
      setState(() {
        _currentAttributeValue.value--;
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
                  AttributeDetails(
                    counterValueNotifier: _currentAttributeValue,
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.blueAccent,
                    onPressed: _incrementAttributeValue,
                  )
                ],
              ),
            ]);
      },
    )) {
    }
  }
}

class AttributeDetails extends StatelessWidget {
  const AttributeDetails({Key? key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // [AnimatedBuilder] accepts any [Listenable] subtype.
      animation: counterValueNotifier,
      builder: (BuildContext context, Widget? child) {
        return Text(
          '${counterValueNotifier.value}',
          style: const TextStyle(
            fontSize: 24.0,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
