import 'package:equatable/equatable.dart';

abstract class CountryEvents extends Equatable {
  const CountryEvents();
}

class LoadCountry extends CountryEvents {
  @override
  List<Object> get props => [];
}
