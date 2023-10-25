import 'package:equatable/equatable.dart';
import 'package:news_app/product/model/country_model.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class CountryInitialState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoadingState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoadedState extends CountryState {
  final CountryNewsModel countries;

  CountryLoadedState(this.countries);

  @override
  List<Object?> get props => [countries];
}

class CountryErrorState extends CountryState {
  final String message;

  CountryErrorState(this.message);

  @override
  List<Object> get props => [message];
}
