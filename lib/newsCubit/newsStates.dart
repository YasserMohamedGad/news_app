abstract class newsStates{}
class intialState extends newsStates{}
class newsBottomNavBarState extends newsStates{}
class changeBottomNavBarItem extends newsStates{}

class newsGetBussinessDataSuccessState extends newsStates{}
class newsGetBussinessDataErrorState extends newsStates{
  final String? error;
  newsGetBussinessDataErrorState(this.error);
}
class newsGetBussinessDataLoadingState extends newsStates{}

class newsGetSportsDataSuccessState extends newsStates{}
class newsGetSportsDataErrorState extends newsStates{
  final String? error;
  newsGetSportsDataErrorState(this.error);

}
class newsGetSportsDataLoadingState extends newsStates{}

class newsGetScienceDataSuccessState extends newsStates{}
class newsGetScienceDataErrorState extends newsStates{
  final String? error;
  newsGetScienceDataErrorState(this.error);
}
class newsGetScienceDataLoadingState extends newsStates{}


class newsGetSearchDataSuccessState extends newsStates{}
class newsGetSearchDataErrorState extends newsStates{
  final String? error;
  newsGetSearchDataErrorState(this.error);
}
class newsGetSearchDataLoadingState extends newsStates{}





