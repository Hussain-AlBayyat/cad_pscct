import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {this.hint,
      this.initialValue,
      this.isSecureText = false,
      this.label,
      this.onTextChanged,
      this.maxLine,
      this.prefix,
      Key? key})
      : super(key: key);
  final String? hint, initialValue, label;
  final bool isSecureText;
  final Widget? prefix;
  final int? maxLine;
  final Function(String text)? onTextChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isSecureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF323232), width: 2),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          widget.prefix ?? Container(),
          SizedBox(
            width: getProportionateScreenWidth(16),
          ),
          Expanded(
              child: TextFormField(
            initialValue: widget.initialValue,
            onChanged: widget.onTextChanged,
            maxLines: widget.maxLine,
            obscureText: _isSecureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                widget.label ?? "",
                style: TextStyle(fontSize: 22),
              ),
              suffixIcon: widget.isSecureText
                  ? IconButton(
                      icon: Icon(
                        _isSecureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isSecureText = !_isSecureText;
                        });
                      },
                    )
                  : null,
              hintText: widget.hint,
            ),
          )),
        ],
      ),
    );
  }

  @override
  void initState() {
    _isSecureText = widget.isSecureText;
    super.initState();
  }
}
