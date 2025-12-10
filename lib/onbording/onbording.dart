import 'package:flutter/material.dart';
import 'package:test_mst/paywall/paywall.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: .infinity,
        child: Stack(
          alignment: .bottomCenter,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/gym.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withAlpha(200),
                        Colors.black.withAlpha(200),
                        Colors.transparent,
                        Colors.black.withAlpha(200),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              child: Text(
                'Самый лучший зал в целой вселенной',
                textAlign: .center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Paywall()),
                    (route) => false,
                  );
                },
                child: Text(
                  'Продолжить',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
