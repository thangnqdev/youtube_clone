import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationEvent {}

class NavigateToTab extends NavigationEvent {
  final int index;
  NavigateToTab(this.index);
}

class NavigationState {
  final int currentIndex;
  NavigationState(this.currentIndex);
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<NavigateToTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}
