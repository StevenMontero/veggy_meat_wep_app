part of 'carousel_cubit.dart';

class CarousellState extends Equatable {
  final List<CarouselModel> bannersList;
  final int current;
  final FormzStatus status;

  const CarousellState({
    required this.bannersList,
    this.status = FormzStatus.pure,
    this.current = 0,
  });

  CarousellState copyWith({
     List<CarouselModel>? bannersList,
     FormzStatus? status,
     int current = 0,

  }) {
    return CarousellState(
      bannersList: bannersList ?? this.bannersList,
      status: status ?? this.status,);
  }

  @override
  List<Object?> get props => [bannersList, status, current];
}
