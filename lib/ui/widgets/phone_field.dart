import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ostello/core/extensions/buildcontext.dart';

class PhoneInputField extends StatefulWidget {
  final TextEditingController ctr;
  final bool inputPhone;
  final int length;
  final int? maxlength;
  const PhoneInputField(
      {super.key,
      this.inputPhone = true,
      required this.ctr,
      required this.length,
      this.maxlength});

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  String selectedCountryCode = 'IN +91';
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.ctr,
      maxLength: widget.maxlength,
      keyboardType:
          widget.inputPhone ? TextInputType.phone : TextInputType.name,
      decoration: InputDecoration(
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        prefixIcon: widget.inputPhone
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCountryCodeDropdown(),
                  SizedBox(
                    height: 35,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(8)
                ],
              )
            : null,
        suffixIcon: isValid
            ? Icon(
                Icons.check_circle,
                color: Color(0xFF00C853), // Green checkmark color
              )
            : null,
      ),
      style: context.textTheme.bodyMedium,
      onChanged: (phone) {
        setState(() {
          isValid = phone.length >= widget.length;
        });
      },
    );
  }

  Widget _buildCountryCodeDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: DropdownButton<String>(
        value: selectedCountryCode,
        underline: SizedBox(),
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          color: Colors.purple,
          size: 35,
        ),
        items: ['IN +91', 'US +1', 'DU +44', 'SL +81'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: const Color.fromRGBO(156, 156, 156, 1))),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedCountryCode = newValue;
            });
          }
        },
      ),
    );
  }
}
