import 'package:flutter/material.dart';

class CustomCircleProgress extends StatelessWidget {
  const CustomCircleProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Image.asset(
            width: 100,
            fit: BoxFit.cover,
            "assets/images/rick-rick-and-morty.gif"),
      ),
    );
  }
}
