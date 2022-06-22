import '../../character/models/character.dart';

class UserModel {
  String id;
  String username;
  String email;
  String password;
  List<CharacterModel> character;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.character,
  });
}
