import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../services/app/app_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Academy Boot Camp"),
      ),
      body: Padding(
        padding: paddingAllM,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select a course..."),
            Expanded(
              child: ListView(
                padding: paddingAllM,
                children: appState.courses!.map((value) {
                  return ListTile(
                    title: Text(value.name),
                    onTap: () {
                      ref.read(appServiceProvider.notifier).selectCourse(value);
                      context.goNamed(AppRoute.course.name);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
