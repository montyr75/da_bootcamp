import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../app/services/app/app_service.dart';

class CoursePage extends ConsumerWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(appState.course?.name ?? ''),
      ),
      drawer: Drawer(
        child: Padding(
          padding: paddingAllM,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lessons"),
              Expanded(
                child: ListView(
                  padding: paddingAllM,
                  children: appState.hasLessons
                      ? appState.course!.lessons!.map((value) {
                          return ListTile(
                            title: Text(value.name),
                            onTap: () async {
                              await ref.read(appServiceProvider.notifier).selectLesson(value);
                              ref.read(goRouterProvider).pop();
                            },
                          );
                        }).toList()
                      : const [],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: paddingAllXL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (appState.hasContent)
              Expanded(
                child: MarkdownWidget(
                  data: appState.lesson!.content!,
                  config: MarkdownConfig.darkConfig,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
