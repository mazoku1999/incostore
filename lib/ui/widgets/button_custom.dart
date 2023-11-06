import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final Color splashColor;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    required this.splashColor,
    required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: widget.borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.7),
            offset: Offset(3, 4.5),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: widget.splashColor,
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
