import 'package:flutter/material.dart';

class CustomCheckBox extends FormField<bool> {
  CustomCheckBox({
    super.key,
    FormFieldValidator<bool>? validator,
    FormFieldSetter<bool>? onSaved,
  }) : super(
          initialValue: false,
          validator: validator,
          onSaved: onSaved,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) => Row(
            children: [
              Checkbox(
                value: state.value ?? false,
                onChanged: (value) {
                  state.didChange(value);
                },
                side: BorderSide(
                  color: state.hasError ? Colors.red : Colors.black,
                ),
              ),
              Text(
                'Agreement',
                style: TextStyle(
                  color: state.hasError ? Colors.red : Colors.black,
                ),
              )
            ],
          ),
        );
}
