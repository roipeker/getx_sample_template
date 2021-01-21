/// copyright 2020, roipeker
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:graphx/graphx.dart';

enum ValidationPlace {
  /// calls [validate()] when you focus out the TextField.
  focus,

  /// calls [validate()] as you type the text.
  change,

  /// in [manual] you take care of calling of the errors on each TextField.
  /// you can use [TextConfig.validateAll([])] to run the [validate()] on each
  /// TextField, or [TextConfig.getErrors([])] to get run [onValidate()] and
  /// get a List<String> of errors (and no TextField UI invalidation).
  manual,
}
enum ErrorMode { none, fixed, float }

class GetInputTextConfig extends GetxController {
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder errorBorder;
  final InputBorder disabledBorder;
  final InputBorder focusedErrorBorder;

  final ValidationPlace validationPlace;
  TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  TextStyle style;
  TextStyle disabledStyle;
  final bool showCounter;
  final String label;
  final IconData icon;
  final bool isPassword;
  final ErrorMode errorMode;
  final bool autocorrect;

  // another instance will control this one.
  GetInputTextConfig _obscureController;

  GetInputTextConfig get obscureController => _obscureController;

  set obscureController(GetInputTextConfig value) {
    _obscureController = value;
    _obscureController?._childObscureToControl = this;
  }

  // this is the child instance to control by the obscureController.
  GetInputTextConfig _childObscureToControl;
  final Iterable<String> autofillHints;
  final List<TextInputFormatter>
      inputFormatters; //FilteringTextInputFormatter.digitsOnly,

  // decoration stuffs.
  final FloatingLabelBehavior floatingLabelBehavior;

  /// should be in an InputDecoration object
  final bool isCollapsed;

  int maxLength;

  bool _obscureText = false;
  FocusNode _focus;
  TextEditingController _controller;
  FormFieldValidator<String> onValidate;

  bool clearErrorOnFocus = true;
  bool clearErrorOnTyping = true;

  String lastError;

  bool _enabled;

  bool get enabled => _enabled;

  TextStyle get _actualStyle {
    if (_enabled ?? true) return style;
    return disabledStyle;
  }

  set enabled(bool val) {
    if (_enabled == val) return;
    _enabled = val;
    update();
  }

  static bool _isValid(String val) {
    if (val == null) return false;
    return val.isNotEmpty;
  }

  static List<String> getErrors(List<GetInputTextConfig> inputs) {
    final output = <String>[];
    for (var i in inputs) {
      final error = i.onValidate(i.value);
      if (!_isValid(error)) output.add(error);
    }
    return output;
  }

  /// Runs [validate()] on each element in [inputs].
  /// [stopOnError] will return false on the first element with an error.
  /// otherwise it will validate() the entire [inputs] List.
  static bool validateAll(List<GetInputTextConfig> inputs,
      {bool stopOnError = true}) {
    bool hasError = false;
    for (var i in inputs) {
      if (!i.validate()) {
        hasError = true;
        if (stopOnError) break;
      }
    }
    return !hasError;
  }

  GetInputTextConfig({
    this.onValidate,
    this.validationPlace = ValidationPlace.manual,
    this.errorMode = ErrorMode.fixed,
    bool enabled,
    this.showCounter = false,
    this.isCollapsed = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.maxLength,
    GetInputTextConfig obscureController,
    this.autocorrect = true,
    this.inputFormatters,
    this.autofillHints,
    this.style,
    this.disabledStyle = const TextStyle(color: Styles.darkGrey),
    this.label,
    this.icon,
    this.border = const UnderlineInputBorder(),
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.isPassword = false,
  }) {
    _obscureText = isPassword;
    obscureController?._childObscureToControl = this;
    this.enabled = enabled;
    _focus = FocusNode();
    _controller = TextEditingController();
  }

//  FocusNode get focus => _focus ??= FocusNode();
//  TextEditingController get controller =>
//      _controller ??= TextEditingController();
  FocusNode get focus => _focus;

  TextEditingController get controller => _controller;

  String get value {
    return controller?.text;
  }

  set value(String val) {
    val ??= '';
    if (val == controller?.text) return;
    controller?.value = controller?.value?.copyWith(text: val);
  }

  bool get obscureText => _obscureText;

  set obscureText(bool flag) {
    if (_obscureText == flag) return;
    _obscureText = flag;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if (initialized) return;
    focus?.addListener(_handleFocus);
    controller?.addListener(_handleTextChange);
  }

  bool get hasFocus => focus?.hasFocus ?? false;

  String _value;

  void _handleTextChange() {
    var val = controller?.text;
    if (val == _value) return;
    _value = val;
    if (onChanged != null) onChanged(_value);
    if (validationPlace == ValidationPlace.change) {
      validate();
    } else {
      if (clearErrorOnTyping) error = '';
    }
  }

  void _handleFocus() {
    if (onFocus != null) onFocus(hasFocus);
    if (!hasFocus) {
      if (validationPlace == ValidationPlace.focus) {
        validate();
      }
    } else {
      if (hasError && clearErrorOnFocus) {
        error = '';
      }
    }
  }

  bool validate() {
    if (onValidate != null) {
      error = onValidate(value);
      lastError = error;
    }
    return !hasError;
  }

  bool get hasError => !lastError.isNullOrBlank;

  /// todo: give ability to access last error...
  /// make a private var, and do error public and holding the last
  /// message.
  String get error => _error;

  set error(String val) {
    if (_error == val) return;
    _error = val;
    if (onErrorChange != null) onErrorChange(!_isValid(_error) ? null : _error);
    update();
  }

  Widget get _counterWidget {
    if (errorMode == ErrorMode.fixed) return null;
    return (showCounter ?? false) ? null : Container();
  }

  String get _counterText {
    if (errorMode == ErrorMode.fixed) return ' ';
    return null; // ErrorMode.float.
  }

  // used by widget
  String get _actualErrorText {
    if (errorMode == ErrorMode.none) return null;
    return !_isValid(_error) ? null : _error;
  }

  String _error;

  Function(String) onChanged;
  Function(bool) onFocus;
  Function(String) onErrorChange;

  bool _disposed = false;

  bool get disposed => _disposed;

  @override
  void onClose() {
    print("CLosed by $label // closed? $_disposed /// ${_clients.length}");
    if (_clients.isNotEmpty) return;
    if (_disposed) return;
    _disposed = true;
    controller?.removeListener(_handleTextChange);
    focus?.removeListener(_handleFocus);
    focus?.unfocus();
    focus?.dispose();
    controller?.dispose();
  }

  Widget getSuffix() {
    if (!isPassword) return null;
    if (obscureController != null) return null;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        obscureText = !obscureText;
        _childObscureToControl?.obscureText = obscureText;
      },
      child: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        color: Styles.lightGrey,
        size: 18,
      ).paddingSymmetric(horizontal: 10, vertical: 6),
    );
  }

  /// Required if multiple `GetInputText` consume the same TextConfig.
  final Set<State> _clients = {};

  void _addClient(State value) => _clients.add(value);

  void _removeClient(State value) => _clients.remove(value);
}

class GetInputText extends StatelessWidget {
  final GetInputTextConfig config;
  final bool autoRemoveConfig;
  final Key textKey;

  const GetInputText({
    Key key,
    this.textKey,
    @required this.config,
    this.autoRemoveConfig = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: config,
      global: false,
      autoRemove: true,
      initState: config._addClient,
      dispose: (state) {
        config._removeClient(state);
        if (autoRemoveConfig && !config.disposed) {
          config?.onClose();
        }
      },
//      assignId: true,
      builder: (_) {
        return TextField(
          key: textKey,
          controller: config?.controller,
          focusNode: config.focus,
          style: config._actualStyle,
          obscureText: config.obscureText,
          keyboardType: config.keyboardType,
          maxLength: config.maxLength,
//          scrollPhysics: NeverScrollableScrollPhysics(),
//          scrollPadding: EdgeInsets.zero,
//           maxLengthEnforced: !config.maxLength.isNull,
          autocorrect: config.autocorrect ?? true,
          autofillHints: (config.enabled ?? true) ? config.autofillHints : null,
          textInputAction: config.textInputAction,
          inputFormatters: config.inputFormatters,
          enabled: config.enabled,
          textCapitalization:
              config.textCapitalization ?? TextCapitalization.none,
          //const InputDecoration()
          decoration: InputDecoration(
            labelText: config.label,
            border: config.border,
            focusedBorder: config.focusedBorder,
            enabledBorder: config.enabledBorder,
            errorBorder: config.errorBorder,
            disabledBorder: config.disabledBorder,
            focusedErrorBorder: config.focusedErrorBorder,
//            errorBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Styles.lightGrey),
//            ),
            contentPadding: EdgeInsets.symmetric(vertical: 6),
            alignLabelWithHint: true,
            floatingLabelBehavior:
                config.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            errorText: config._actualErrorText,
            errorMaxLines: 1,
            counterText: config._counterText,
            counter: config._counterWidget,
            icon: config.icon != null
                ? Icon(config.icon, size: 20).paddingOnly(top: 10)
                : null,
            isCollapsed: config.isCollapsed ?? false,
            suffixIconConstraints: BoxConstraints(maxWidth: 24, maxHeight: 24),
//          suffixIcon: config.isPassword ? config.getSuffix() : null,
            suffix: config.isPassword ? config.getSuffix() : null,
          ),
        );
      },
    );
  }
}
