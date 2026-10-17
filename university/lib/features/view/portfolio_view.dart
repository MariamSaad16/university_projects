import 'package:flutter/material.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343449),
      appBar: AppBar(
        title: const Text('Portfolio'),
        backgroundColor: const Color(0xFF343449),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'My Projects',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}