import 'package:flutter/material.dart';

class WidgetPosition {
  getSizes(GlobalKey key) {
    final RenderBox renderBoxRed =
        key.currentContext!.findRenderObject() as RenderBox;
    final sizeRed = renderBoxRed.size;
    return [sizeRed.width, sizeRed.height];
  }

  getPositions(GlobalKey key) {
    final RenderBox renderBoxRed =
        key.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    // print("POSITION: $positionRed ");
    return [positionRed.dx, positionRed.dy];
  }
}
