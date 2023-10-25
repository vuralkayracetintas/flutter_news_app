import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_events.dart';
import 'package:news_app/bloc/country_bloc/country_state.dart';
import 'package:news_app/product/repository/country_repository.dart';

class CountryBloc extends Bloc<CountryEvents, CountryState> {
  final CountryNewsRepository countryRepository;

  CountryBloc(this.countryRepository) : super(CountryLoadingState()) {
    on<LoadCountry>(
      (event, emit) async {
        emit(CountryLoadingState());
        try {
          final countryModel = await countryRepository.getCountryNews();
          emit(CountryLoadedState(countryModel));
        } catch (e) {
          if (e is Exception) {
            emit(CountryErrorState(e.toString()));
          } else {
            emit(CountryErrorState("Unexpected error"));
          }
        }
      },
    );
  }
}
