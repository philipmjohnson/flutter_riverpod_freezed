import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
            Gap(20.h),
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
