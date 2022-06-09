import 'package:my_rpg/character/model/attribute_repository.dart';
import 'package:my_rpg/character/view/shared/basic_attribute.dart';

class AttributeViewModel {
  AttributeViewModel({required this.repository});

  final AttributeRepository repository;
  List<BasicAttribute> basicAttributes = [];

  void buildBasicAttributes() {
    repository.findAll().forEach((attribute) {
      basicAttributes.add(BasicAttribute(attributeModel: attribute));
    });
  }

  List<BasicAttribute> attributes() {
    buildBasicAttributes();

    return basicAttributes;
  }
}
