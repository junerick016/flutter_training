import 'package:advicer/1_domain/failures/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Unexpected Error';
const serverFailureMessage = 'Server Failure';
const cacheFailureMessage = 'Cache Failure';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUsecases = AdviceUseCases();
  // could also use other usecases

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    final failureOrAdvice = await adviceUsecases.getAdvice();
    failureOrAdvice.fold(
      (failure) =>
          emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
