import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_bloc.dart';
import 'package:news_app/bloc/country_bloc/country_events.dart';

import 'package:news_app/bloc/country_bloc/country_state.dart';

class CountryHomeView extends StatefulWidget {
  CountryHomeView({
    super.key,
    required this.state,
  });

  final CountryLoadedState state;

  @override
  State<CountryHomeView> createState() => _CountryHomeViewState();
}

class _CountryHomeViewState extends State<CountryHomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.countries.articles?.length ?? 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.state.countries.articles?[index].title ?? '',
          ),
        );
      },
    );
  }
}
