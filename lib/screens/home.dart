import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BannerCarousel(),
      ],
    );
  }
}

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Semantics(
          label: 'list_view',
          child: Column(
            children: List.generate(
              99,
              (index) => BannerCard(index + 1),
            ),
          ),
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  final int cardIndex;

  const BannerCard(this.cardIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 4,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Banner $cardIndex',
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
