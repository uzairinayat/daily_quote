import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes_daily/BLoC/bloc_implementation.dart';
import 'package:qoutes_daily/BLoC/bloc_state.dart';
import 'package:qoutes_daily/Widgets/card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state.favorites.isEmpty) {
          return Center(
            child: const Text(
              "No favorite quotes yet!",
              style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic , color: Colors.white),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.favorites.length,
          itemBuilder: (context, index) {
            return QuoteCard(quote: state.favorites[index]);
          },
        );
      },
    );
  }
}
