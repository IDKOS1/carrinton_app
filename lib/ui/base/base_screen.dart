import 'package:carrinton_app/models/nav_enum_model.dart';
import 'package:carrinton_app/provider/circle_progress_provider.dart';
import 'package:carrinton_app/provider/collect_info_provider.dart';
import 'package:carrinton_app/provider/current_body_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget.dart';

class BaseScreen extends ConsumerWidget {
  final Nav page;
  final Widget body; // body 추가

  const BaseScreen({Key? key, required this.page, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectInfo = ref.watch(collectInfoProvider);

                                                                                                                  // 임의의 값으로 테스트
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final read = ref.read(progressNotifierProvider.notifier);
    //   if (page == Nav.home) {
    //     read.updateProgress(66.0);
    //   } else if (page == Nav.collected) {
    //     read.updateProgress(33.0);
    //   }
    // });

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

