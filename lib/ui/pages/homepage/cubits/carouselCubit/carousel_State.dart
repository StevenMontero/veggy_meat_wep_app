part of 'carousel_cubit.dart';
//** Carrousel state parte del patro cubit, contienen la lista 
//que se utiliza para cargar las imagenes del carrousel y el status*/
class CarousellState extends Equatable {
  final List<CarouselModel> bannersList;
  final int current;
  final FormzStatus status;

  const CarousellState({
    required this.bannersList,
    this.status = FormzStatus.pure,
    this.current = 0,
  });
  //**Método que recibe recibe la lista de las imagenes y setea la lista del state */
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
