part of 'carousel_cubit.dart';

class CarouselState extends Equatable{
  
  final String? image;
  final bool? isSelected;

  const CarouselState({
    this.image,
    this.isSelected,
  });

  CarouselState copyWith({
    String? image,
    bool? isSelected,
  }){
    return CarouselState(
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [
        image,
        isSelected, 
      ];


}