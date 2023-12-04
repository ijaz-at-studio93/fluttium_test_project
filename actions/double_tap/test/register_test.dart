import 'package:flutter_test/flutter_test.dart';
import 'package:fluttium/fluttium.dart';
import 'package:double_tap/double_tap.dart';
import 'package:mocktail/mocktail.dart';

class _MockRegister extends Mock implements Registry {}

void main() {
  test('can be registered', () {
    final registry = _MockRegister();
    when(
      () => registry.registerAction(
        any(),
        any(),
        shortHandIs: any(named: 'shortHandIs'),
      ),
    ).thenAnswer((_) {});

    register(registry);

    verify(
      () => registry.registerAction(
        any(that: equals('doubleTap')),
        any(that: equals(DoubleTap.new)),
        shortHandIs: any(named: 'shortHandIs', that: equals(#text)),
      ),
    ).called(1);
  });
}
