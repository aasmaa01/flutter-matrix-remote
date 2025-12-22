import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Control Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MatrixControlScreen(),
      );
  }
}
//mat controller
class MatrixControlScreen extends StatefulWidget{
  const MatrixControlScreen({super.key});

  @override
  State<MatrixControlScreen> createState() => _MatrixControlScreenState();


}
class _MatrixControlScreenState extends State<MatrixControlScreen>{
   
  int selectedRow = 0; 
  int selectedCol = 0; 

  
  
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
    
    void reset(){
      setState(() {
        selectedRow = 0;
        selectedCol = 0;
      });
    }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote control Challenge !'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxGrid(selectedRow: selectedRow, selectedCol: selectedCol),
                  const SizedBox(width: 40),
                  RemoteControl(
                    onReset: reset,
                    onUp: moveUp,
                    onDown: moveDown,
                    onLeft: moveLeft,
                    onRight: moveRight,
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxGrid(selectedRow: selectedRow, selectedCol: selectedCol),
                  const SizedBox(height: 20),
                  RemoteControl(
                    onReset: reset,
                    onUp: moveUp,
                    onDown: moveDown,
                    onLeft: moveLeft,
                    onRight: moveRight,
                  ),
                ],
              );
            }
          },
        ),
      ),

      
      );
  }

}


// BOXES WIDGET - Displays the 5x5 grid
class BoxGrid extends StatelessWidget {
  final int selectedRow;
  final int selectedCol;

  const BoxGrid({
    super.key,
    required this.selectedRow,
    required this.selectedCol,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (row) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (col) {
              // Check if this box is selected
              bool isSelected = (row == selectedRow && col == selectedCol);
              
              return Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[300],
                  border: Border.all(
                    color: isSelected ? Colors.blue[900]! : Colors.grey,
                    width: isSelected ? 3 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
// REMOTE WIDGET - Displays the directional buttons
class RemoteControl extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onUp;
  final VoidCallback onDown;
  final VoidCallback onLeft;
  final VoidCallback onRight;

  const RemoteControl({
    super.key,
    required this.onReset,
    required this.onUp,
    required this.onDown,
    required this.onLeft,
    required this.onRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: [

          Row(children: [
          // reset button
          IconButton(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            iconSize: 30,
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey[800],
              foregroundColor: Colors.red,
            )
          ),
          ],),
          const SizedBox(height: 10),
          Column(
            children: [
            // UP button
            IconButton(
              onPressed: onUp,
              icon: const Icon(Icons.arrow_upward),
              iconSize: 40,
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            // LEFT, CENTER, RIGHT row
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LEFT button
                IconButton(
                  onPressed: onLeft,
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 40,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                // CENTER (non-functional placeholder)
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                // RIGHT button
                IconButton(
                  onPressed: onRight,
                  icon: const Icon(Icons.arrow_forward),
                  iconSize: 40,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // DOWN button
            IconButton(
              onPressed: onDown,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 40,
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}