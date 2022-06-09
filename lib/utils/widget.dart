import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg/utils/style.dart';

// class CustomSliverAppBar extends StatelessWidget {
//   final String title;
//   final bool centerTittle;

//   CustomSliverAppBar({
//     Key? key,
//     this.title = '',
//     this.centerTittle = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       title: Text(title),
//       centerTitle: centerTittle,
//       backgroundColor: Colors.black87,
//     );
//   }
// }

/**
 * Widgets para os Slivers
 */

/// Método para constuir a SliveAppBar
class CustomSliverAppBar extends StatelessWidget {
  final bool pinned;
  final bool floating;
  final Widget? leading;
  final double? expandedHeight;
  final bool centerTitle;
  final String textTopSliver;
  final double fontSizeTextTopSliver;
  final String textSliver;
  final FlexibleSpaceBar flexibleSpace;

  const CustomSliverAppBar({
    Key? key,
    this.pinned = true,
    this.floating = false,
    this.leading,
    this.flexibleSpace = const FlexibleSpaceBar(),
    this.textTopSliver = '',
    this.fontSizeTextTopSliver = 20,
    this.textSliver = '',
    this.expandedHeight,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      leading: leading,
      backgroundColor: Colors.black87,
      title: Text(
        textTopSliver,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSizeTextTopSliver,
        ),
      ),
      centerTitle: centerTitle,
      flexibleSpace: flexibleSpace,
    );
  }
}

/**
* Widgets de texto e label
*/

/// Class para renderizar o Widget do TextFormField Customizado
class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? customFocusNode;
  final FormFieldValidator<String>? customValidator;
  final ValueChanged<String>? customOnChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyBoardType;
  final bool obscureValue;
  final bool readOnly;
  final int? maxLineField;
  final int? maxLengthCharacter;
  final bool enable;
  final double margin;

  const CustomTextFormField({
    Key? key,
    this.labelText = '',
    required this.hintText,
    required this.controller,
    this.customFocusNode,
    this.customValidator,
    this.customOnChanged,
    this.inputFormatters,
    this.keyBoardType = TextInputType.text,
    this.obscureValue = false,
    this.readOnly = false,
    this.maxLineField,
    this.maxLengthCharacter,
    this.enable = true,
    this.margin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextFormFieldLabel(labelText: labelText),
        Container(
          margin: EdgeInsets.only(bottom: margin),
          child: TextFormField(
            controller: controller,
            focusNode: customFocusNode,
            validator: customValidator,
            onChanged: customOnChanged,
            inputFormatters: inputFormatters,
            keyboardType: keyBoardType,
            obscureText: obscureValue,
            readOnly: readOnly,
            maxLines: maxLineField,
            maxLength: maxLengthCharacter,
            enabled: enable,
            style: TextStyle(
              fontSize: 16,
              color: enable ? Colors.black : Colors.grey,
            ),
            decoration: CustomTextFormFieldStyle.textFieldStyle(
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}

/// Class para renderizar o label customizado dos formulários
class CustomTextFormFieldLabel extends StatelessWidget {
  final String labelText;

  const CustomTextFormFieldLabel({Key? key, required this.labelText})
      : super(key: key);

  get customColorLabelTextFormField => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 8,
        left: 4,
      ),
      child: Text(
        labelText,
        style: TextStyle(
          color: customColorLabelTextFormField,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Class para renderizar o autocomplete customizado dos formulários
/// O parâmetro items deve ser uma lista de strings para serem filtrados no
/// momento em que o usuário digita a procura do tipo certo
class CustomAutoComplete extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator<String>? customValidator;

  const CustomAutoComplete({
    Key? key,
    required this.items,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.customValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        // if (textEditingValue.text == '') {
        //   return const Iterable<String>.empty();
        // }
        return items.where(
          (String option) {
            return option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          },
        );
      },
      fieldViewBuilder: (BuildContext context, controller, FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFormFieldLabel(labelText: labelText),
            Container(
              margin: const EdgeInsets.only(bottom: 18),
              child: TextFormField(
                controller: controller,
                decoration: CustomTextFormFieldStyle.textFieldStyle(
                  hintText: hintText,
                ),
                validator: customValidator,
                focusNode: focusNode,
              ),
            ),
          ],
        );
      },
      onSelected: (String selection) {
        controller.text =
            items.indexWhere((String item) => item == selection).toString();
        // log(items.indexWhere((String item) => item == selection).toString());
        //  firstWhere((element) => element == selection));
      },
    );
  }
}

/**
* Widget de lista
*/


/// Class para renderizar o Widget do ListView Customizado
class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  // final Function onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.icon,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      // onTap: onTap,
    );
  }
}
