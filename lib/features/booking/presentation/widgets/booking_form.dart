import 'package:flutter/material.dart';

class BookingForm extends StatelessWidget {
  final String hint;
  final String title;
  final String initialvalue;
  final TextInputType keyboardtype;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSave;
  BookingForm(
      {super.key,
      required this.hint,
      required this.title,
      required this.initialvalue,
      required this.keyboardtype,
      this.validator,
      this.onSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 8,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            keyboardType: keyboardtype,
            initialValue: initialvalue,
            decoration: InputDecoration(hintText: hint),
            validator: validator,
            onSaved: onSave,
          ),
        )
      ],
    );
  }
}
