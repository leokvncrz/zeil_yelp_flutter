import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yelp_nyc_business/core/interfaces/yelp_service.dart';
import 'package:yelp_nyc_business/core/models/business.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int offset = 0;
  final YelpService yelpService;
  HomeBloc({required this.yelpService}) : super(HomeInitial()) {
    on<GetNYCBusinessList>((event, emit) async {
      // Ignore if fully loaded
      if (state is HomeFullyLoaded) return;

      // Ignore if already loading
      if (state is HomeLoading) return;

      final businessList = <BusinessModel>[];
      if (state is HomeLoaded) {
        businessList.addAll((state as HomeLoaded).businesses);
        emit(HomeLoading(businessList));
        offset = businessList.length;
      }
      try {
        final fetchResult =
            await yelpService.getNYCBusinessList(offset: offset);
        if (fetchResult.isSuccess) {
          businessList.addAll(fetchResult.args!);
          if (fetchResult.message == businessList.length.toString()) {
            emit(HomeFullyLoaded(businessList));
          } else {
            emit(HomeLoaded(businessList));
          }
        } else {
          emit(HomeError(fetchResult.message));
        }
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
