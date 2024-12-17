import 'package:carrinton_app/presentation/ui/base/provider/get_collect_info_usecase_provider.dart';
import 'package:carrinton_app/presentation/ui/base/widgets/status_bar.dart';
import 'package:carrinton_app/presentation/ui/base/widgets/top_profile.dart';
import 'package:carrinton_app/presentation/ui/base/provider/nav_enum_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScreen extends ConsumerWidget {
  final Nav page;
  final Widget body;

  const BaseScreen({super.key, required this.page, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectInfoAsync = ref.watch(collectInfoViewModelProvider);

    final collectInfo = collectInfoAsync.when(
      loading: () => null,
      error: (err, stack) => null,
      data: (data) => data,
    );

    return SafeArea(
      child: Scaffold(
        body: collectInfo == null
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            : Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    const TopProfile(),
                    const SizedBox(height: 20),
                    CollectStatusBar(page: page, collectInfo: collectInfo),
                    const SizedBox(height: 20),
                    Expanded(child: body),
                  ],
                ),
              ),
      ),
    );
  }
}
