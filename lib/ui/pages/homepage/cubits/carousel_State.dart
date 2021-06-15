part of 'carousel_cubit.dart';

class CarouselState extends Equatable {
  final List<CarouselModel>? bannersList;

  const CarouselState({
    this.bannersList,
  });

  CarouselState copyWith({
    required List<CarouselModel> bannersList,
  }) {
    return CarouselState(bannersList: bannersList);
  }

  @override
  List<Object?> get props => [bannersList];
}
