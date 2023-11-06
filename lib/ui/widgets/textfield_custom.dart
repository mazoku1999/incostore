import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final VoidCallback onPressed;
  final String? hintText;
  final Color? containerColor;
  final Color? cursorColor;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.onPressed,
    this.hintText,
    this.containerColor,
    this.cursorColor,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPressed = false;
  final FocusNode _focusNode = FocusNode();
  final color = const Color.fromARGB(255, 255, 246, 221);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      isPressed = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 60,
        decoration: BoxDecoration(
          color: widget.containerColor ?? color,
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: isPressed
              ? [
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 3.5),
                  )
                ]
              : [
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                  ),
                ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: widget.controller,
            cursorColor: widget.cursorColor ?? Colors.black,
            onTap: () {
              setState(() {
                isPressed = true;
              });
            },
            onTapOutside: (event) {
              setState(() {
                isPressed = false;
                _focusNode.unfocus();
              });
            },
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, right: 15),
              hintText: widget.hintText ?? "Correo",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
