import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graphx/graphx.dart';

class FormValidations {
  static String email(String val) {
    val = val.trim();
    if (val.isEmpty) return 'Email cant be empty';
    if (val.length <= 4) return 'Email is too short';
    if (!val.isEmail) return 'Email is invalid';
    return null;
  }

  static String matchPasswords(String val1, String val2) {
    if (val1.isEmpty || val2.isEmpty) return 'Passwords cant be empty';
    if (val1 != val2) return 'Passwords doesnt match';
    return null;
  }

  static String password(String val) {
    if (val.isEmpty) return 'Password cant be empty';
    if (val.length <= 4) return 'Password is too short';
    if (val.isAlphabetOnly) return 'Password must be alphanumeric';
    return null;
  }

  static String name(String val, {String label}) {
    val = val.trim();
    if (val.isEmpty) return '"$label" can not be empty';
    if (val.length <= 2) return '"$label" is too short';
    return null;
  }

  static String phone(String val) {
    val = val.trim();
    val = val.replaceAll(' ', '');
    if (val.isEmpty) return 'Phone is required';
    if (val.length <= 7) return 'Phones needs at least 7 numbers';
    if (!val.isNumericOnly) return 'Please, use only numbers';
    return null;
  }
}

class FormInputFormatters {
  static List<TextInputFormatter> priceFormatter = [
    FilteringTextInputFormatter.allow(RegExp('[0-9\\.,\$]')),
  ];
}

class FormFormatters {
  static var filterName =
      FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z á-ú Á-Ú]'));
  static var filterPhone = FilteringTextInputFormatter.digitsOnly;
}

/// Format zipcode in format #####-####
class ZipTextInputFormatter extends TextInputFormatter {
  static final instance = ZipTextInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 6) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 5) + '-');
      if (newValue.selection.end >= 5) selectionIndex++;
    }

    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(
        offset: selectionIndex,
      ),
    );
  }
}
