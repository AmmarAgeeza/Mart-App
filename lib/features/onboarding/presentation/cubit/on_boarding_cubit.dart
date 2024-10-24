import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/database/cache/cache_consumer.dart';

import '../../../../core/database/cache/cache_keys.dart';
import '../../../../core/services/service_locator.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  void saveCacheVisition() async {
    emit(OnBoardingLoading());
    try {
      await sl<CacheConsumer>().saveData(
        key: CacheKeys.visitedOnBoarding,
        value: true,
      );
      emit(OnBoardingSucess());
    } catch (e) {
      emit(OnBoardingError(error: e.toString()));
    }
  }
}
