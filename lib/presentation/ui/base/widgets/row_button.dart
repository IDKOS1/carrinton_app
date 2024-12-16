import 'package:carrinton_app/presentation/model/widget/flex_button.dart';
import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'medium_text_box.dart';

class RowButton extends ConsumerWidget {
  final List<FlexButton> buttonList;
  final StateProvider<int> stateProvider;

  const RowButton(
      {super.key, required this.buttonList, required this.stateProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(stateProvider);
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < buttonList.length; i++) ...[
          MediumTextBox(
            title: buttonList[i].title,
            backgroundColor: selectedIndex == i ? mainColor : null,
            textColor: selectedIndex == i ? Colors.white : middleGray,
            borderColor: selectedIndex == i ? Colors.transparent : null,
            flex: buttonList[i].flex,
            onTap: buttonList[i].isClickable
                ? () {
                    ref.read(stateProvider.notifier).state = i;
                  }
                : null,
          ),
          if (i != buttonList.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }
}