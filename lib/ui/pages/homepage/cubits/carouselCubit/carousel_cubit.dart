import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/domain/models/carouselModel.dart';
import 'package:veggy/data/production/repositories/banner_repository.dart';

part 'carousel_State.dart';

class CarouselCubit extends Cubit<CarousellState> {
  CarouselCubit(this.bannerRepository) : super(CarousellState(bannersList: []));
  final BannerRepository bannerRepository;

  void isSelectedChange(List<CarouselModel> list){
    emit(state.copyWith(bannersList: list));
  }

  void currentChange(int index){
    emit(state.copyWith(current: index));
  }

  void getBannersList() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      List<CarouselModel> bannersList = await bannerRepository.allBannersImages();
      if (bannersList.isEmpty == true) {
      bannersList.add(new CarouselModel(
          image: 'assets/images/Portada veggy - 28 abril 2021 v03.png',
          index: 0,
          isSelected: true));
    } 
      emit(state.copyWith(status: FormzStatus.submissionSuccess, bannersList: bannersList));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
