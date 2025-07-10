import 'package:qoutes_daily/Widgets/quotes.dart';

abstract class QuoteEvent {}
class ToggleFavorite extends QuoteEvent {
  final Quote quote;
  ToggleFavorite(this.quote);
}