import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'features/app/services/app/app_service.dart';
import 'features/app/services/theme/theme_service.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // make sure app service is created, which loads the courses JSON
    ref.read(appServiceProvider);

    final themeState = ref.watch(themeServiceProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dart Academy Boot Camp',
      theme: themeState.light,
      darkTheme: themeState.dark,
      themeMode: themeState.mode,
      restorationScopeId: 'app',
      routerConfig: ref.watch(goRouterProvider),
      builder: FlutterSmartDialog.init(),
    );
  }
}