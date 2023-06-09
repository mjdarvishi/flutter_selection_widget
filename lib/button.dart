
import 'dart:async';

import 'package:flutter/material.dart';
typedef BtnAction = FutureOr Function();

class Button extends StatefulWidget {

  final  BtnAction change;
  String title;
  Color color;
  Color? textColor;
  final double radios;
  @override
  _ButtonState createState() => _ButtonState();

  Button({this.radios= 10,required this.change,required this.title,required this.color,this.textColor});
}

class _ButtonState extends State<Button> {
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: double.infinity,
      child: GestureDetector(
        onTap:()async {
         try{
           FocusManager.instance.primaryFocus?.unfocus();
           if(!loading) {
             setState(()=>loading=true);
             await widget.change();
             setState(()=>loading=false);
           }
         }catch(err){
           setState(()=>loading=false);
           rethrow;
         }
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radios),
              color: widget.color),
          child: Text(widget.title,
              style:  TextStyle(
                color: widget.textColor??Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
      ),
    );
  }

}
