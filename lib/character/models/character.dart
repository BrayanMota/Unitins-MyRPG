import 'package:my_rpg/character/token/models/token.dart';

class CharacterModel {
  String? id;
  String? name;
  final TokenModel? tokenModel;

  CharacterModel({
    this.id,
    this.name,
    this.tokenModel,
  });
}
