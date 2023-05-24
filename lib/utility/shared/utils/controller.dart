import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'cards.dart';
import 'swipe_info.dart';

/// Card controller
class TCardController {
  TCardState? state;

  void bindState(TCardState state) {
    this.state = state;
  }

  int get index => state?.frontCardIndex ?? 0;

  forward({SwipeDirection? direction}) {
    direction ??=
        Random().nextBool() ? SwipeDirection.left : SwipeDirection.right;

    state!.swipeInfoList.add(SwipeInfo(state!.frontCardIndex, direction));
    state!.runChangeOrderAnimation();
  }

  updateCard(Widget widget) {
    state!.refresh(state!.frontCardIndex, widget);
  }

  back() {
    state!.runReverseOrderAnimation();
  }

  get reset => state!.reset;

  void dispose() {
    state = null;
  }

  void removeCard() {
    state!.remove(state!.frontCardIndex);
  }

  void cleanCard() {
    if (state != null) {
      state!.reset();
    }
  }
}
