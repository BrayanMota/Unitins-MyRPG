// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_rpg/character/service/attribute_service.dart';

import '../../models/attribute.dart';

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
                  fontSize: 25.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
              AttributeBonus(counterValueNotifier: _currentAttributeValue),
              AttributeValue(
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
        if (_currentAttributeValue.value < 30) {
          _currentAttributeValue.value++;
        }
      });
    }

    void _decrementAttributeValue() {
      setState(() {
        if (_currentAttributeValue.value > 1) {
          _currentAttributeValue.value--;
        }
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
                    backgroundColor: Colors.black87,
                    onPressed: _decrementAttributeValue,
                  ),
                  AttributeValue(
                    counterValueNotifier: _currentAttributeValue,
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.black87,
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

class AttributeValue extends StatelessWidget {
  const AttributeValue({Key? key, required this.counterValueNotifier});

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

class AttributeBonus extends StatelessWidget {
  const AttributeBonus({Key? key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // [AnimatedBuilder] accepts any [Listenable] subtype.
      animation: counterValueNotifier,
      builder: (BuildContext context, Widget? child) {
        return Text(
          AttributeService.calculateBonus(counterValueNotifier.value),
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
