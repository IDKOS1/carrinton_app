import 'package:carrinton_app/presentation/view_models/base/nav_enum_model.dart';
import 'package:carrinton_app/presentation/view_models/base/collect_info_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/status_bar.dart';
import 'widgets//top_profile.dart';

class BaseScreen extends ConsumerWidget {
  final Nav page;
  final Widget body; // body 추가

  const BaseScreen({Key? key, required this.page, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectInfo = ref.watch(collectInfoProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const TopProfile(),
              const SizedBox(height: 20),
              CollectStatusBar(page: page, collectInfo: collectInfo),
              const SizedBox(height: 20),
              Expanded(child: body), // 전달된 body를 표시
            ],
          ),
        ),
      ),
    );
  }
}
