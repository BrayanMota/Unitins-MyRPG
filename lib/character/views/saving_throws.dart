import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharacterSavingThrows extends StatefulWidget {
  const CharacterSavingThrows({Key? key}) : super(key: key);

  @override
  State<CharacterSavingThrows> createState() => _CharacterSavingThrowsState();
}

class _CharacterSavingThrowsState extends State<CharacterSavingThrows> {
  final _formKey = GlobalKey<FormState>();

  bool _isStrengthChecked = false;
  TextEditingController _strengthController = TextEditingController();
  int _strengthValue = 0;

  bool _isDexterityChecked = false;
  TextEditingController _dexterityController = TextEditingController();
  int _dexterityValue = 0;

  bool _isConstituionChecked = false;
  TextEditingController _constitutionController = TextEditingController();
  int _constitutionValue = 0;

  bool _isIntelligenceChecked = false;
  TextEditingController _intelligenceController = TextEditingController();
  int _intelligenceValue = 0;

  bool _isWisdomChecked = false;
  TextEditingController _wisdomController = TextEditingController();
  int _wisdomValue = 0;

  bool _isCharismaChecked = false;
  TextEditingController _charismaController = TextEditingController();
  int _charismaValue = 0;

  int proeficiencyBonus = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        _buildSavingThrows(),
      ],
    );
  }

  void _savingThrowCalculation(
      bool isChecked, int value, TextEditingController controller) {
    value = controller.text.isEmpty ? 0 : int.parse(controller.text);
    if (isChecked) {
      value += proeficiencyBonus;
    } else {
      value -= proeficiencyBonus;
    }
    controller.text = value.toString();
  }

  Widget _buildSavingThrows() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            children: [
              Checkbox(
                value: _isStrengthChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isStrengthChecked = value!;
                    _savingThrowCalculation(_isStrengthChecked, _strengthValue,
                        _strengthController);
                  });
                },
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _strengthController,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Força'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _isDexterityChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isDexterityChecked = value!;
                    _savingThrowCalculation(_isDexterityChecked,
                        _dexterityValue, _dexterityController);
                  });
                },
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _dexterityController,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Destreza'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _isConstituionChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isConstituionChecked = value!;
                    _savingThrowCalculation(_isConstituionChecked,
                        _constitutionValue, _constitutionController);
                  });
                },
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _constitutionController,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Constituição'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _isIntelligenceChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isIntelligenceChecked = value!;
                    _savingThrowCalculation(_isIntelligenceChecked,
                        _intelligenceValue, _intelligenceController);
                  });
                },
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _intelligenceController,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Inteligência'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _isWisdomChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isWisdomChecked = value!;
                    _savingThrowCalculation(
                        _isWisdomChecked, _wisdomValue, _wisdomController);
                  });
                },
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _wisdomController,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Sabedoria'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _isCharismaChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isCharismaChecked = value!;
                    _savingThrowCalculation(_isCharismaChecked, _charismaValue,
                        _charismaController);
                  });
                },
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _charismaController,
                  decoration: InputDecoration(),
                ),
              ),
              Text('Carisma'),
            ],
          ),
        ],
      ),
    );
  }
}
