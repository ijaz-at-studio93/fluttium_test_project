import 'package:fluttium/fluttium.dart';
import 'package:flutter/gestures.dart';

class DoubleTap extends Action {
  const DoubleTap({
    this.text,
    this.offset,
  });

  final String? text;
  final List<double>? offset;

  static int _pointerId = 0;

  @override
  Future<bool> execute(Tester tester) async {
    final Offset center;

    if (text != null) {
      final node = await tester.find(text!);
      if (node == null) {
        return false;
      }
      center = node.center;
    } else if (offset != null) {
      center = Offset(offset!.first, offset!.last);
    } else {
      return false;
    }

    final pointer = _pointerId++;
    tester.emitPointerEvent(
      PointerDownEvent(pointer: pointer, position: center),
    );
    await tester.pump(duration: kPressTimeout);
    tester.emitPointerEvent(
      PointerUpEvent(pointer: pointer, position: center),
    );
    await tester.pump(duration: kPressTimeout);
    tester.emitPointerEvent(
      PointerDownEvent(pointer: pointer, position: center),
    );
    await tester.pump(duration: kPressTimeout);
    tester.emitPointerEvent(
      PointerUpEvent(pointer: pointer, position: center),
    );
    await tester.pumpAndSettle();

    return true;
  }

  @override
  String description() {
    if (text != null) {
      return 'Double tap: "$text"';
    } else if (offset != null) {
      return 'Double tap: [${offset!.first}, ${offset!.last}]';
    }
    throw UnsupportedError('Double tap must have either text or offset');
  }
}
