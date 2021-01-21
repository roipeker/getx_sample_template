import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../const/const.dart';
import '../../../../../utils/form_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widgets/widgets.dart';

class PasswordFields {
  GetInputTextConfig oldPassword = GetInputTextConfig(
    onValidate: (val) => FormValidations.password(val),
    label: AppStrings.oldPassword,
    maxLength: 255,
    isPassword: true,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.send,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [AutofillHints.newPassword],
    errorMode: ErrorMode.float,
  );

  GetInputTextConfig newPassword = GetInputTextConfig(
    onValidate: (val) => FormValidations.password(val),
    label: AppStrings.newPassword,
    maxLength: 255,
    isPassword: true,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.send,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [AutofillHints.newPassword],
    errorMode: ErrorMode.float,
    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig repeatNewPassword = GetInputTextConfig(
    onValidate: (val) => FormValidations.password(val),
    label: AppStrings.repeatNewPassword,
    maxLength: 255,
    isPassword: true,
//    obscureController: password,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.send,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [AutofillHints.newPassword],
    errorMode: ErrorMode.fixed,
    validationPlace: ValidationPlace.manual,
  );

  List<GetInputTextConfig> allFields;

  PasswordFields() {
    allFields = [oldPassword, newPassword, repeatNewPassword];
  }

  // AuthRequestDto get passwordDto => AuthRequestDto.fromChangePassword(
  //       newPassword: newPassword.value,
  //       oldPassword: oldPassword.value,
  //     );

  bool validate() {
    var error = '';
    for (var input in allFields) {
      if (!input.validate()) {
        error = input.error;
        break;
      }
    }
    if (error.isNotEmpty) {
      AppGetUtils.showError(error);
      return false;
    } else {
      // validate passwords stand alone.
      error = FormValidations.matchPasswords(
              newPassword.value, repeatNewPassword.value) ??
          '';
      if (error.isNotEmpty) {
        repeatNewPassword.error = error;
        AppGetUtils.showError(error);
        return false;
      }
    }
    return true;
  }

  void clear() {
    for (var input in allFields) {
      input.value = '';
      input.obscureText = true;
    }
  }

  void obscure() {
    for (var input in allFields) {
      input.obscureText = true;
    }
  }
}
