import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonIcon extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final double? width;

  CustomButtonIcon(
      {required this.text,
      required this.icon,
      required this.onPressed,
      this.width});

  @override
  _CustomButtonIconState createState() => _CustomButtonIconState();
}

class _CustomButtonIconState extends State<CustomButtonIcon> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onLongPressUp: () {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: widget.width ?? 250,
        height: 60,
        decoration: BoxDecoration(
          // border: Border.all(color: isPressed ? Colors.transparent : Colors.black, width: 2),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: isPressed ? Colors.transparent : Colors.black,
              offset: Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isPressed
                  ? widget.width ?? 250
                  : MediaQuery.of(context).size.width * 0.140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.indigo.shade300,
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: isPressed ? 150 : 450),
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: isPressed ? Colors.transparent : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  child: Text(widget.text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
