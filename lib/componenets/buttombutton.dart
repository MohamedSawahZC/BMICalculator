import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
BottomButton({@required this.onTap,@required this.buttonTitle});
 Function onTap;
 String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child:Text(
            buttonTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        color: bottomBarColour,
        height: 60.0,
      ),
    );
  }
}


