import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tv/on_the_air_tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class OnTheAirTvPage extends StatefulWidget {
  const OnTheAirTvPage({super.key});

  @override
  State<OnTheAirTvPage> createState() => _OnTheAirTvPageState();
}

class _OnTheAirTvPageState extends State<OnTheAirTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => () => context.read<OnTheAirTvBloc>().add(FetchOnTheAirTv()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On The Air Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnTheAirTvBloc, OnTheAirTvState>(
          builder: (context, state) {
            if (state is OnTheAirTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OnTheAirTvHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.tv[index];
                  return TvCard(movie);
                },
                itemCount: state.tv.length,
              );
            } else if (state is OnTheAirTvError) {
              return Center(
                key: const Key('error_message'),
                child: Text(
                  state.message,
                ),
              );
            } else {
              return const Center(child: Text('Failed'));
            }
          },
        ),
      ),
    );
  }
}
