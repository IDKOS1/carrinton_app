import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/view_models/home/store_detail/state/signature_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class Signature extends ConsumerWidget {
  final String description;
  const Signature({super.key, required this.description});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signaturePadKey =
        ref.watch(signaturePadProvider.notifier).signaturePadKey;
    final ui.Image? signatureImage = ref.watch(signaturePadProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        // 서명
        Text(
          'signature',
          style: CustomStyle.headMedium(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      titlePadding: const EdgeInsets.all(16),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      actionsPadding: const EdgeInsets.only(bottom: 16),
                      title: Text(
                        "signature",
                        style: CustomStyle.appBarTitle(),
                      ),
                      content: AspectRatio(
                        aspectRatio: 5 / 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: AppColors.middleGray),
                          ),
                          child: SfSignaturePad(
                            key: signaturePadKey,
                          ),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(signaturePadProvider.notifier)
                                          .clear();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border:
                                              Border.all(color: AppColors.middleGray)),
                                      child: Center(
                                        child: Text(
                                          'Retry',
                                          style: CustomStyle.headMedium(
                                              color: AppColors.middleGray),
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                child: GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(signaturePadProvider.notifier)
                                          .save();
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.purple,
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: CustomStyle.headMedium(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: AspectRatio(
                  aspectRatio: 5 / 3,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.middleGray),
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: RawImage(image: signatureImage),
                      )),
                ),
              ),
            ),
            Flexible(
              child: Text(
                description,
                textAlign: TextAlign.end,
                style: CustomStyle.bodyMedium(),
                softWrap: true,
                overflow: TextOverflow.visible, // 텍스트가 넘칠 경우 처리 방식
              ),
            )
          ],
        ),
      ],
    );
  }
}
