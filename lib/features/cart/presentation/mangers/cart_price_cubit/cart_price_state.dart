part of 'cart_price_cubit.dart';

@immutable
sealed class CartPriceState {}

final class CartPriceInitial extends CartPriceState {}

final class CartPriceSuccess extends CartPriceState {}
