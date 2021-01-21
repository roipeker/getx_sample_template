import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/utils/utils.dart';
import 'package:getx_app_template/widgets/widgets.dart';

class SignupFields {
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
    errorMode: ErrorMode.fixed,
//    validationPlace: ValidationPlace.manual,
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
    errorMode: ErrorMode.fixed,
//    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig email = GetInputTextConfig(
    label: AppStrings.email,
    onValidate: (val) => FormValidations.email(val),
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    maxLength: 200,
    autofillHints: [
      AutofillHints.username,
      AutofillHints.email,
    ],
//    errorMode: ErrorMode.fixed,
//    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig phone = GetInputTextConfig(
    label: AppStrings.phone,
    onValidate: (val) => FormValidations.phone(val),
//    inputFormatters: [FormFormatters.filterPhone],
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.phone,
    maxLength: 28,
    autofillHints: [
      AutofillHints.telephoneNumberDevice,
      AutofillHints.telephoneNumber,
      AutofillHints.telephoneNumberNational,
    ],
//    errorMode: ErrorMode.fixed,
//    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig password = GetInputTextConfig(
    onValidate: (val) => FormValidations.password(val),
    label: AppStrings.password,
    maxLength: 255,
    isPassword: true,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.send,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [AutofillHints.newPassword],
//    errorMode: ErrorMode.float,
//    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig repeatPassword = GetInputTextConfig(
    onValidate: (val) => FormValidations.password(val),
    label: AppStrings.repeatPassword,
    maxLength: 255,
    isPassword: true,
//    obscureController: password,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.send,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [AutofillHints.newPassword],
//    errorMode: ErrorMode.fixed,
//    validationPlace: ValidationPlace.manual,
  );

  List<GetInputTextConfig> allFields;
  SignupFields() {
    allFields = [name, lastname, email, phone, password, repeatPassword];
    repeatPassword.obscureController = password;
  }

  bool validate() {
    var error = '';
    for (var i in allFields) {
      if (!i.validate()) {
        error = i.error;
        break;
      }
    }

    if (error.isNotEmpty) {
      AppGetUtils.showError(error);
      return false;
    } else {
      // validate passwords stand alone.
      error = FormValidations.matchPasswords(
              password.value, repeatPassword.value) ??
          '';
      if (error.isNotEmpty) {
        repeatPassword.error = error;
        AppGetUtils.showError(error);
        return false;
      }
    }
    return true;
  }

  // AuthRequestDto get signupDto => AuthRequestDto.fromRegister(
  //       name: name.value.trim(),
  //       surname: lastname.value.trim(),
  //       email: email.value.trim(),
  //       password: password.value,
  //       phone: phone.value.trim(),
  //     );
  //
  // void setDto(AuthRequestDto dto) {
  //   name.value = dto.name;
  //   lastname.value = dto.surname;
  //   phone.value = dto.phone;
  //   email.value = dto.email;
  //   password.value = dto.password;
  //   repeatPassword.value = dto.password;
  // }
}
