import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

class TopRatedTvPage extends StatefulWidget {
  const TopRatedTvPage({super.key});

  @override
  State<TopRatedTvPage> createState() => _TopRatedTvPageState();
}

class _TopRatedTvPageState extends State<TopRatedTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => () => context.read<TopRatedTvBloc>().add(FetchTopRatedTv()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvBloc, TopRatedTvState>(
          builder: (context, state) {
            if (state is TopRatedTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.tv[index];
                  return TvCard(movie);
                },
                itemCount: state.tv.length,
              );
            } else if (state is TopRatedTvError) {
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
