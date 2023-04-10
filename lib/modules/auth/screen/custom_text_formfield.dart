import 'package:flutter/material.dart';

class CustomTextFormField extends FormField<String> {
  CustomTextFormField({
    super.key,
    this.controller,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
    final String? hintText,
    final String? labelText,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            debugPrint('Error hasError ${state.hasError}');
            debugPrint('Error isValid ${state.isValid}');
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: controller,
                    onChanged: (value) {
                      state.didChange(value);
                    },
                    decoration: InputDecoration(
                      labelText: labelText,
                      hintText: hintText,
                      filled: true,
                      fillColor: state.value == null || state.value == ''
                          ? Colors.red
                          : Colors.white,
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 15,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            state.errorText.toString(),
                            style: const TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    )
                ],
              ),
            );
          },
        );

  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends FormFieldState<String> {
  CustomTextFormField get _textFormField => super.widget as CustomTextFormField;

  @override
  void initState() {
    super.initState();

    if (_textFormField.controller != null) {
      _textFormField.controller?.addListener(_handleControllerChanged);
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  void _handleControllerChanged() {
    didChange(_textFormField.controller?.text);
  }
}
