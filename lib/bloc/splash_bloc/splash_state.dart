abstract class SplashState {}

class LoadingSplashState extends SplashState {}

class SuccessSplashState extends SplashState {}

class FailureSplashState extends SplashState {
  final String? error;

  FailureSplashState({this.error});
}
