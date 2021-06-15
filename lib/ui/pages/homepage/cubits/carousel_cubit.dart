import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/domain/models/carouselModel.dart';
import 'package:veggy/data/production/repositories/banner_repository.dart';

part 'carousel_State.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit(this.bannerRepository) : super(CarouselState());
  final BannerRepository bannerRepository;

  Future<List<CarouselModel>> getBannersList() async {
    List<CarouselModel> bannersList = await bannerRepository.allBannersImages();
    if (bannersList.isEmpty == true) {
      bannersList.add(new CarouselModel(
          image: 'assets/images/Portada veggy - 28 abril 2021 v03.png',
          index: 0,
          isSelected: true));
    } 
    emit(state.copyWith(bannersList: bannersList));
    return bannersList;
  }
}
