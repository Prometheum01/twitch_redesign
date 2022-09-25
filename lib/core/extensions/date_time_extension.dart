import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String? get toStringDMY {
    String? date;
    if (this != null) {
      date =
          '${DateFormat.d().format(this!)}/${DateFormat.M().format(this!)}/${DateFormat.y().format(this!)}';
    }

    return date;
  }
}
