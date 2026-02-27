import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribtion_reminder/features/onboarding/view/onboarding.dart';
import 'package:subscribtion_reminder/core/theme/app_theme.dart';
import 'package:subscribtion_reminder/features/subscription_func/logic/subscription_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://xgednzkczcqoyihzzpll.supabase.co",
    anonKey: '"sb_publishable_3oim2FmEVWw0nfT5zVwr5Q_dCJ-DhPc"',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MultiProvider(
      providers: [
        // auth provider
        ChangeNotifierProvider(create: (context) => SubscriptionProvider()),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
