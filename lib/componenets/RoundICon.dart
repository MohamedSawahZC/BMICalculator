import 'package:flutter/material.dart';

class RoundIconButton extends StatefulWidget {
  RoundIconButton({@required this.icona,this.onPressed});
  final IconData icona;
  final Function onPressed;
  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(widget.icona),
      onPressed: widget.onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}