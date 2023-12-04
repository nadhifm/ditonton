part of 'drawer_bloc.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

class DrawerPage extends DrawerState {
  final Widget currentPage;

  const DrawerPage(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
