import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryInfoProvider =
StateNotifierProvider<CountryInfoNotifier, CountryCode?>(
        (ref) => CountryInfoNotifier());

class CountryInfoNotifier extends StateNotifier<CountryCode?> {
  CountryInfoNotifier() : super(_defaultCountryCode);

  static const CountryCode _defaultCountryCode = CountryCode(
    name: 'Malaysia',
    code: 'MY',
    dialCode: '+60'
  );
  // CountryCode 객체 설정
  void setCountryInfo({
    required CountryCode countryCode,
  }) {
    state = countryCode;
  }

  // 초기화
  void clearCountryInfo() {
    state = null;
  }
}
