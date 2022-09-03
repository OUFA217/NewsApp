// ignore_for_file: empty_constructor_bodies

abstract class NewsStates {}
class appchangemodestate extends NewsStates {}
class NewsInitialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsgetLoadingSuccessState extends NewsStates {}

class NewsgetBusniessSuccessState extends NewsStates {}

class NewsgetBusniessErrorState extends NewsStates {
  final String error;

  NewsgetBusniessErrorState(this.error);
}

class NewsSportsgetLoadingSuccessState extends NewsStates {}

class NewsSportsSuccessState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  final String error;

  NewsSportsErrorState(this.error);
}

class NewsSciencegetLoadingSuccessState extends NewsStates {}

class NewsScienceSuccessState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {
  final String error;

  NewsScienceErrorState(this.error);
}

class NewsSearchbargetLoadingSuccessState extends NewsStates {}

class NewsSearchbarSuccessState extends NewsStates {}

class NewsSearchbarerrorState extends NewsStates {
  final String error;

  NewsSearchbarerrorState(this.error);
}
