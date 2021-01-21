import 'package:flutter/material.dart';
import 'package:getx_app_template/const/strings.dart';
import 'package:getx_app_template/utils/utils.dart';
import 'package:getx_app_template/widgets/widgets.dart';
import 'package:graphx/graphx.dart';

class LoginFields {
  GetInputTextConfig email = GetInputTextConfig(
    label: AppStrings.email,
    onValidate: FormValidations.email,
    icon: Icons.email,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    maxLength: 80,
    autofillHints: [AutofillHints.username, AutofillHints.email],
    isPassword: false,
    errorMode: ErrorMode.fixed,
    validationPlace: ValidationPlace.manual,
  );

  GetInputTextConfig password = GetInputTextConfig(
    label: AppStrings.password,
    onValidate: FormValidations.password,
    icon: Icons.lock_outlined,
    maxLength: 255,
    isPassword: true,
    textCapitalization: TextCapitalization.none,
    textInputAction: TextInputAction.send,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [AutofillHints.password],
    errorMode: ErrorMode.fixed,
    validationPlace: ValidationPlace.manual,
  );
  List<GetInputTextConfig> allFields;

  LoginFields() {
    allFields = [email, password];
    email.clearErrorOnTyping = false;
    password.clearErrorOnTyping = false;
  }

  // void setDto(AuthRequestDto dto) {
  //   email.value = dto.email;
  //   password.value = dto.password;
  // }
  // AuthRequestDto get loginDto => AuthRequestDto.fromLogin(
  //       email: email.value.trim(),
  //       password: password.value,
  //     );
  // AuthRequestDto get forgotPassDto => AuthRequestDto.fromForgotPassword(
  //       email: email.value.trim(),
  //     );

  void dispose() {}
}
