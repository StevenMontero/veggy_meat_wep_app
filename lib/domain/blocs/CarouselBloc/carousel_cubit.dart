import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'carousel_State.dart';

class CarouselCubit extends Cubit<CarouselState>{
  CarouselCubit(CarouselState initialState) : super(initialState);
}