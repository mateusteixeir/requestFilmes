import 'package:flutter/material.dart';

void main() {
  runApp(MyButton());
}

class MyButton extends StatefulWidget{
  const MyButton({super.key});

  @override
  _MyButton createState() => _MyButton();

}

class _MyButton  extends State<MyButton>{
  bool _isPressed = false;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My Button',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Button'),
        ),
        body: Center(
          child: Container(
          decoration: BoxDecoration(
    color: _isPressed ? Colors.blue : Colors.red,
    ),
            child: ElevatedButton(
    onPressed:
              (){
                setState(() {
                  _isPressed = !_isPressed;
                });
              }, child: Text('Press Me!')
          ),

        ),
      ),

    ),
    );
  }

}

