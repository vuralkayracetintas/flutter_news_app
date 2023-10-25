import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_events.dart';
import 'package:news_app/bloc/country_bloc/country_state.dart';
import 'package:news_app/core/category/news_category.dart';
import 'package:news_app/product/enum/category_enum.dart';
import 'package:news_app/product/repository/country_repository.dart';

class CountryHomeView extends StatefulWidget {
  const CountryHomeView({super.key});

  @override
  State<CountryHomeView> createState() => _CountryHomeViewState();
}

class _CountryHomeViewState extends State<CountryHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(
        RepositoryProvider.of<CountryNewsRepository>(context),
      )..add(LoadCountry()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Haberler ve Kategoriler'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            // İlk sliver: Yatayda kategoriler
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100, // İstenilen yüksekliği ayarlayın
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryEnum.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = CategoryEnum.values[index];
                    return InkWell(
                      onTap: () {
                        // Kategoriye tıklanıldığında yapılacak işlemler buraya
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(category.toString().split('.').last),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // İkinci sliver: Dikeyde haberler
            BlocBuilder<CountryBloc, CountryState>(
              builder: (BuildContext context, state) {
                if (state is CountryInitialState ||
                    state is CountryLoadingState) {
                  return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is CountryErrorState) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text('Hata: ${state.message}'),
                    ),
                  );
                } else if (state is CountryLoadedState) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            state.countries.articles?[index].title ?? '',
                          ),
                        );
                      },
                      childCount: state.countries.articles?.length ?? 0,
                    ),
                  );
                }
                return SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}
