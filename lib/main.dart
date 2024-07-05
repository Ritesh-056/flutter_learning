import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:session_app/custom_paint/draw_circle.dart';
import 'package:session_app/payment_gateway/khalti_payment_screen.dart';
import 'package:session_app/riverpod/providers.dart';
import 'package:session_app/todo/todo_form.dart';

void main() async{
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      child: const MyPage(),
    ),
  ); //entry point of the application
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: dotenv.get("PUBLIC_KEY"),
      builder: (context, navigatorKey){
        return MaterialApp(
        navigatorKey: navigatorKey,
        supportedLocales: const [
        Locale('en', 'US'),
        Locale('ne', 'NP'),
      ],
      localizationsDelegates: const [KhaltiLocalizations.delegate],
        home: const KhaltiInterfaceScreen(),
      );
      },
      
    );
  }
}

class MyHome extends ConsumerWidget {
  const MyHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "Current value is:  \n" + count.toString(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              ref.watch(counterProvider.notifier).increment();
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              ref.watch(counterProvider.notifier).decrement();
            },
          ),
        ],
      ),
    );
  }
}
