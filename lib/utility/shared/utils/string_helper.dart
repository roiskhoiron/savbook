// ignore_for_file: unnecessary_string_escapes

import 'package:get/get_utils/src/extensions/string_extensions.dart';

extension StringExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstofEach =>
      split(' ').map((str) => str.capitalize).join(' ');

  String get inStringify => replaceAll('"', '\\"')
      .replaceAll('\n', '\\n    ')
      .replaceAll(',', ',\\n    ')
      .replaceAll(':', ': ')
      .replaceAll('{', '{\\n    ')
      .replaceAll('}', '\\n    }');

  String get trueEnumFormat => replaceAll('__', ':').replaceAll('_', '-');

  bool get isKosong => isEmpty;
}
