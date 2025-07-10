import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes_daily/BLoC/bloc_event.dart';
import 'package:qoutes_daily/BLoC/bloc_implementation.dart';
import 'package:qoutes_daily/Widgets/quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    final isFavorited = context.watch<QuoteBloc>().state.favorites.contains(
      quote,
    );
    return Card(
      color: const Color.fromARGB(82, 71, 61, 61),
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1, // or adjust based on your design
              child: Image.asset(quote.imageUrl, fit: BoxFit.contain),
            ),
            const SizedBox(height: 10),
            Text(
              '"${quote.text}"',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic,color: Colors.white),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '- ${quote.author}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () =>
                  context.read<QuoteBloc>().add(ToggleFavorite(quote)),
            ),
          ],
        ),
      ),
    );
  }
}
