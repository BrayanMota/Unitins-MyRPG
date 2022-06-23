
import 'attribute.dart';

class AttributeRepository {
  List<AttributeModel> findAll() {
    return [
      AttributeModel('Força', 15, 3),
      AttributeModel('Destreza', 8, 1),
      AttributeModel('Constituição', 18, 4),
      AttributeModel('Inteligência', 16, 3),
      AttributeModel('Sabedoria', 16, 3),
      AttributeModel('Carisma', 14, 2)
    ];
  }
}
