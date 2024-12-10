import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/widgets/new_jerry_can_list.dart';
import 'package:carrinton_app/presentation/view_models/home/store_detail/state/jerry_can_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreCollectedScreen extends ConsumerStatefulWidget {
  final int price;
  const StoreCollectedScreen({super.key, required this.price});

  @override
  ConsumerState<StoreCollectedScreen> createState() =>
      _StoreCollectedScreenState();
}

class _StoreCollectedScreenState extends ConsumerState<StoreCollectedScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newCanList = ref.watch(jerryCanListProvider);

    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Weight(kg)',
                    style:
                        CustomStyle.headMedium(color: const Color(0xFF0B373D))),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        '25',
                        style: CustomStyle.headMedium(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount',
                    style:
                        CustomStyle.headMedium(color: const Color(0xFF0B373D))),
                Row(
                  children: [
                    Text('${widget.price * 25} MYR',
                        style: CustomStyle.headMedium(color: mainColor)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('New Jerry can number at the shop',
                style: CustomStyle.bodyMedium()),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter jerry can number',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      if (_controller.text.isNotEmpty) {
                        ref
                            .read(jerryCanListProvider.notifier)
                            .addCan(_controller.text);
                        _controller.clear();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        '+ Add',
                        style: CustomStyle.headMedium(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            NewJerryCanList(canList: newCanList)
          ],
        ),
      ),
    );
  }
}
