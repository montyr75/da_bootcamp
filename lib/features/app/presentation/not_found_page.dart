import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "404 -- Page Not Found",
              style: context.textStyles.headlineMedium,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () => context.goNamed(AppRoute.home.name),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
