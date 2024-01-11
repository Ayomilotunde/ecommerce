import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  final Color? color;
  bool light = false;
  final IconData? icon;
  final Color? textColor;
  bool block = false;

  Button(
      {required this.onPressed,
      required this.text,
      this.color,
      this.light = false,
      this.icon,
      this.textColor,
      this.block = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.block == true ? MediaQuery.of(context).size.width : 120,
      height: 50,
      child: ElevatedButton(
        onPressed: this.onPressed,
        style: TextButton.styleFrom(
          elevation: 1,
          backgroundColor: this.light == false ? this.color : Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: this.icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("${this.text}  ",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: this.light == false
                                ? Colors.white
                                : this.textColor != null
                                    ? this.textColor
                                    : this.color != null
                                        ? this.color
                                        : Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  Icon(
                    this.icon,
                    color: this.light == false
                        ? Colors.white
                        : this.textColor != null
                            ? this.textColor
                            : this.color != null
                                ? this.color
                                : Colors.blue,
                    size: 25,
                  )
                ],
              )
            : Container(
                child: Center(
                  child: Text(this.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 1,
                          color: this.textColor != null
                              ? this.textColor
                              : this.light == false
                                  ? Colors.white
                                  : Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
              ),
      ),
    );
  }
}
