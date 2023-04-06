import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<String> helloWorldProvider =
    Provider<String>((ProviderRef<String> ref) {
  return 'Hello world';
});
