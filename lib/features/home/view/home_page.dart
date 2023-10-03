import 'package:flutter/material.dart';
import 'package:riverpod_api/features/home/widgets/home_btn.dart';
import 'package:riverpod_api/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod/Freezed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButton(
                title: 'jokes',
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.joke);
                }),
            const SizedBox(height: 20),
            HomeButton(
                title: 'products',
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.product);
                }),
          ],
        ),
      ),
    );
  }
}
