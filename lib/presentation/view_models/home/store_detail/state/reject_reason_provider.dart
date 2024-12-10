import 'package:flutter_riverpod/flutter_riverpod.dart';

final rejectReasonProvider =
    StateProvider.autoDispose<String?>((ref) => 'No Oil');
