import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/view_models/home/store_detail/state/jerry_can_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewJerryCanList extends StatelessWidget {
  final List<String> canList;

  const NewJerryCanList({super.key, required this.canList});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          spacing: 8,
          runSpacing: 16,
          children: canList.map((can) => NewJerryCan(canNumber: can)).toList(),
        ));
  }
}

class NewJerryCan extends ConsumerWidget {
  final String canNumber;
  const NewJerryCan({super.key, required this.canNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: orange),
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            canNumber,
            style: CustomStyle.headMedium(color: orange),
          ),
          const SizedBox(
            width: 2,
          ),
          GestureDetector(
            onTap: () {
              ref.read(jerryCanListProvider.notifier).removeCan(canNumber);
            },
            child: SvgPicture.asset('assets/images/icon_delete.svg'),
          )
        ],
      ),
    );
  }
}
