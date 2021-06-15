import 'package:bloc/bloc.dart';

class CounterquantityCubit extends Cubit<int> {
  CounterquantityCubit() : super(1);

  void addProductQuatity() {
    emit(state + 1);
  }

  void removeProductQuatity() {
    emit(state <= 0 ? state : state - 1);
  }
}
