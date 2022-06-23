import '../models/attribute_repository.dart';
import '../views/shared/basic_attribute.dart';

class AttributeViewModel {
  AttributeViewModel({
    required this.repository,
  });

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
