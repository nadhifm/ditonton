part of 'drawer_bloc.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends DrawerEvent {
  final Widget newPage;

  const ChangePage(this.newPage);

  @override
  List<Object> get props => [newPage];
}
