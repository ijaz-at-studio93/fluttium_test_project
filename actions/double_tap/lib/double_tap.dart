import 'package:fluttium/fluttium.dart';
import 'package:double_tap/double_tap.dart';

export 'src/double_tap.dart';

/// Will be executed by Fluttium on startup.
void register(Registry registry) {
  registry.registerAction(
    'doubleTap',
    DoubleTap.new,
    shortHandIs: #text,
  );
}
