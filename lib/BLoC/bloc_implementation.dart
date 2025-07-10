import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes_daily/BLoC/bloc_event.dart';
import 'package:qoutes_daily/BLoC/bloc_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteState([])) {
    on<ToggleFavorite>((event, emit) {
      final isFavorited = state.favorites.contains(event.quote);
      final updated = List.of(state.favorites);
      
      if (isFavorited) {
        updated.remove(event.quote);
      } else {
        updated.add(event.quote);
      }

      emit(QuoteState(updated));
    });
  }
}
