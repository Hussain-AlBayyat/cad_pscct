import 'dart:math';

import 'package:flutter/material.dart';

import '../Theme/theme.dart';

class NameThisLater extends StatelessWidget {
  const NameThisLater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        width: 250,
        height: 250,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppTheme.totalSpendGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Spend",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              "\$${Random().nextInt(99 - 0)}MM",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
