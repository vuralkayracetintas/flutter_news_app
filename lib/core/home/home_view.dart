import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_events.dart';
import 'package:news_app/bloc/country_bloc/country_state.dart';
import 'package:news_app/core/category/news_category.dart';
import 'package:news_app/core/country/country_view.dart';
import 'package:news_app/product/repository/country_repository.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(
        RepositoryProvider.of<CountryNewsRepository>(context),
      )..add(LoadCountry()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Haberler ve Kategoriler'),
        ),
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (BuildContext context, state) {
            debugPrint('state ${state.runtimeType}');
            if (state is CountryInitialState || state is CountryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CountryErrorState) {
              return Center(
                child: Text('Hata: ${state.message}'),
              );
            } else if (state is CountryLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<CountryBloc>(context).add(LoadCountry());
                },
                child: Column(
                  children: [
                    TextField(),
                    NewsCategoryList(),
                    Expanded(
                      child: CountryHomeView(
                        state: state,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
