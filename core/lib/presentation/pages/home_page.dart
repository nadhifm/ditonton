import 'package:core/presentation/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/movie_page.dart';
import 'package:tv_series/presentation/pages/tv_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerState>(builder: (context, state) {
      final currentPage =
          state is DrawerPage ? state.currentPage : const HomePage();
      return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('ditonton@dicoding.com'),
              ),
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Movies'),
                onTap: () {
                  context.read<DrawerBloc>().add(const ChangePage(MoviePage()));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.tv_rounded),
                title: const Text('Tv Series'),
                onTap: () {
                  context.read<DrawerBloc>().add(const ChangePage(TvPage()));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Watchlist Movie'),
                onTap: () {
                  Navigator.pushNamed(context, watchlistMovieRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Watchlist Tv'),
                onTap: () {
                  Navigator.pushNamed(context, watchlistTvRoute);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, aboutRoute);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
              currentPage.toString() == "MoviePage" ? 'Movie' : 'Tv Series'),
          actions: [
            IconButton(
              onPressed: () {
                currentPage.toString() == "MoviePage"
                    ? Navigator.pushNamed(context, searchRoute)
                    : Navigator.pushNamed(context, searchTvRoute);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: currentPage,
      );
    });
  }
}
