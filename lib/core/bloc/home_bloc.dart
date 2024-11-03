import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yelp_nyc_business/core/interfaces/yelp_service.dart';
import 'package:yelp_nyc_business/core/models/business.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final YelpService yelpService;
  HomeBloc(this.yelpService) : super(HomeInitial()) {
    on<GetNYCBusinessList>((event, emit) async {
      emit(HomeLoading());
      try {
        final fetchResult = await yelpService.getNYCBusinessList();
        if (fetchResult.isSuccess) {
          emit(HomeLoaded(fetchResult.args!));
        } else {
          emit(HomeError(fetchResult.message));
        }
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
