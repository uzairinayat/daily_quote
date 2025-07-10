import 'package:flutter/material.dart';
import 'package:qoutes_daily/Widgets/card.dart';
import 'package:qoutes_daily/Widgets/quotes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        return QuoteCard(quote: quotes[index]);
      },
    );
  }
}