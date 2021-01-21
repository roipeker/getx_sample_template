import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_app_template/services/session/models/user.dart';

import '../../../../../const/const.dart';
import '../../../../../utils/form_utils.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widgets/widgets.dart';

class UserInfoFields {
  UserModel _model;

  GetInputTextConfig email = GetInputTextConfig(
    label: AppStrings.email,
    onValidate: (val) => FormValidations.email(val),
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    enabled: false,
    maxLength: 200,
    autofillHints: [
      AutofillHints.username,
      AutofillHints.email,
    ],
    errorMode: ErrorMode.float,
  );

  GetInputTextConfig name = GetInputTextConfig(
    label: AppStrings.name,
    textCapitalization: TextCapitalization.words,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    onValidate: (val) => FormValidations.name(val, label: AppStrings.name),
    maxLength: 15,
    inputFormatters: [FormFormatters.filterName],
    autofillHints: [
      AutofillHints.name,
      AutofillHints.creditCardName,
    ],
//    errorMode: ErrorMode.fixed,
    errorMode: ErrorMode.float,
  );

  GetInputTextConfig lastname = GetInputTextConfig(
    label: AppStrings.lastname,
    onValidate: (val) => FormValidations.name(val, label: AppStrings.lastname),
    textCapitalization: TextCapitalization.words,
    textInputAction: TextInputAction.next,
    inputFormatters: [FormFormatters.filterName],
    keyboardType: TextInputType.name,
    maxLength: 26,
    autofillHints: [
      AutofillHints.familyName,
      AutofillHints.givenName,
      AutofillHints.creditCardFamilyName
    ],
//    errorMode: ErrorMode.fixed,
    errorMode: ErrorMode.float,
//    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig phone = GetInputTextConfig(
    label: AppStrings.phone,
    onValidate: (val) => FormValidations.phone(val),
    inputFormatters: [FormFormatters.filterPhone],
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.phone,
    maxLength: 28,
    autofillHints: [
      AutofillHints.telephoneNumberDevice,
      AutofillHints.telephoneNumber,
      AutofillHints.telephoneNumberNational,
    ],
    errorMode: ErrorMode.float,
//    errorMode: ErrorMode.fixed,
//    validationPlace: ValidationPlace.manual,
  );

  List<GetInputTextConfig> allFields;

  UserInfoFields() {
    allFields = [name, lastname, phone];
  }

  void enable(bool flag) {
    allFields.forEach((input) {
      input.style = !flag ? const TextStyle(color: Styles.darkGrey) : null;
      input.enabled = flag;
    });
  }

  void reset() {
    if (_model == null) {
      throw 'Cant reset without a model!';
    }
    setModel(_model);
  }

  void setModel(UserModel model) {
    _model = model;
    name.value = model.name;
    lastname.value = model.lastname;
    email.value = model.email;
    phone.value = model.phone;
  }

  UserModel getModel() {
    return null;
//     return UserModel.fromValue(
//       name: name.value,
//       lastname: lastname.value,
//       email: email.value,
//       phone: phone.value,
// //      password: password.value,
//     );
  }

  // AuthRequestDto get updateDto => AuthRequestDto.fromUpdate(
  //       name: name.value.trim(),
  //       surname: lastname.value.trim(),
  //       phone: phone.value.trim(),
  //     );

  bool validate() {
    String error = '';
    for (var input in allFields) {
      if (!input.validate()) {
        error = input.error;
        break;
      }
    }
    if (error.isNotEmpty) {
      AppGetUtils.showError(error);
      return false;
    }
    return true;
  }
}
