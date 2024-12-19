import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/login/provider/country_code_provider.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class CountryPicker extends ConsumerWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var logger = Logger();

    final countryPicker = const FlCountryCodePicker();
    final countryInfo = ref.watch(countryInfoProvider);

    return GestureDetector(
      onTap: () async {
        // 국가 코드 선택창 띄우기
        final picked = await countryPicker.showPicker(context: context);
        if (picked != null) {
          logger.d(
              'code: ${picked.code}\ndialCode: ${picked.dialCode}\nname: ${picked.name}\nnationalSignificationNumber: ${picked.nationalSignificantNumber}\n'
                  'flagImagePackage: ${picked.flagImagePackage}\nflagUri: ${picked.flagUri}');
          ref
              .read(countryInfoProvider.notifier)
              .setCountryInfo(countryCode: picked);
        }
      },
      child: SizedBox(
        width: 70.w,
        child: countryInfo == null
            ? Text('Show Picker', style: const TextStyle(color: Colors.black))
            : Row(
          children: [
            Image.asset(
              countryInfo.flagUri,
              package: countryInfo.flagImagePackage,
              width: 25,
              height: 25,
            ),
            SizedBox(width: 8.w),
            Text(
              countryInfo.dialCode,
              textAlign: TextAlign.start,
              style: CustomStyle.bodyMedium(),
            )
          ],
        ),
      ),
    );
  }
}