import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/view_models/home/store_detail/state/reject_reason_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoNoCollectedScreen extends ConsumerWidget {
  const PoNoCollectedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReason = ref.watch(rejectReasonProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please select the reason for not collection.',
          textAlign: TextAlign.start,
          style: CustomStyle.bodyMedium(),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.transparent),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RejectReason(
                    rejectReason: 'No Oil',
                    isSelected: selectedReason == 'No Oil',
                    onTap: () => ref.read(rejectReasonProvider.notifier).state =
                        'No Oil',
                  ),
                  const SizedBox(width: 8),
                  RejectReason(
                    rejectReason: 'Little Oil',
                    isSelected: selectedReason == 'Little Oil',
                    onTap: () => ref.read(rejectReasonProvider.notifier).state =
                        'Little Oil',
                  ),
                  const SizedBox(width: 8),
                  RejectReason(
                    rejectReason: 'Shop Closed',
                    isSelected: selectedReason == 'Shop Closed',
                    onTap: () => ref.read(rejectReasonProvider.notifier).state =
                        'Shop Closed',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RejectReason(
                    rejectReason: 'Price\nproblem',
                    isSelected: selectedReason == 'Price\nproblem',
                    onTap: () => ref.read(rejectReasonProvider.notifier).state =
                        'Price\nproblem',
                  ),
                  const SizedBox(width: 8),
                  RejectReason(
                    rejectReason: 'Rejected\nOur offer',
                    isSelected: selectedReason == 'Rejected\nOur offer',
                    onTap: () => ref.read(rejectReasonProvider.notifier).state =
                        'Rejected\nOur offer',
                  ),
                  const SizedBox(width: 8),
                  RejectReason(
                    rejectReason: 'Other',
                    isSelected: selectedReason == 'Other',
                    onTap: () =>
                        ref.read(rejectReasonProvider.notifier).state = 'Other',
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RejectReason extends StatelessWidget {
  final String rejectReason;
  final bool isSelected;
  final VoidCallback onTap;

  const RejectReason({
    super.key,
    required this.rejectReason,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: isSelected ? null : Border.all(color: orange),
            color: isSelected ? orange : Colors.transparent,
          ),
          child: Center(
            child: Text(
              rejectReason,
              style: CustomStyle.headMedium(
                  color: isSelected ? Colors.white : orange),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
