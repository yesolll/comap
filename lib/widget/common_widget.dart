import 'package:flutter/material.dart';

class LineWg extends StatelessWidget {
  final int type;
  final double lheight;
  final Color color;

  const LineWg({super.key, this.type = 0, this.lheight = 2.0, this.color = Colors.black12});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: type == 1 ? 1.0 : lheight,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              type == 1
                  ? Colors.black
                  : lheight == 2.0
                  ? type == 0
                  ? Colors.black12
                  : Colors.black
                  : color,
              type == 1
                  ? Colors.black
                  : lheight == 2.0
                  ? Colors.transparent
                  : color,
            ],
          ),
        ),
      ),
    );
  }
}