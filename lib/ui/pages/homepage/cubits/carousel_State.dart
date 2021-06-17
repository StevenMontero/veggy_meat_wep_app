part of 'carousel_cubit.dart';

class CarousellState extends Equatable {
  final List<CarouselModel> bannersList;
  final FormzStatus status;

  const CarousellState({
    required this.bannersList,
    this.status = FormzStatus.pure
  });

  CarousellState copyWith({
     List<CarouselModel>? bannersList,
     FormzStatus? status,
  }) {
    return CarousellState(
      bannersList: bannersList ?? this.bannersList,
      status: status ?? this.status,);
  }

  @override
  List<Object?> get props => [bannersList, status];
}
