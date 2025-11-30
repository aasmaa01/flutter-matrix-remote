import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MatrixController()
      );
  }
}
//mat controller
class MatrixController extends StatefulWidget{
  const MatrixController({super.key})

  //hadi te3 ai 
  @override
  State<MatrixController> createState() => _MatrixControllerState();


}
class _MatrixControllerState extends State<MatrixController>{
  int selectedIndex=0 ;//ndiroh m 0 l 24
  //or 
  int selectedRow = 0; // 0 to 4
  int selectedCol = 0; // 0 to 4

  
  
    void moveUp() {
      if (selectedRow > 0) {
        setState(() => selectedRow -= 1);
      }
    }

    void moveDown() {
      if (selectedRow < 4) {
        setState(() => selectedRow += 1);
      }
    }

    void moveLeft() {
      if (selectedCol > 0) {
        setState(() => selectedCol -= 1);
      }
    }

    void moveRight() {
      if (selectedCol < 4) {
        setState(() => selectedCol += 1);
      }
    }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        Ch(),
      ),
    );
  }

}


