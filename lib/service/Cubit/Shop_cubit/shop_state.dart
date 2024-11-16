abstract class ShopState {}

class initialState extends ShopState {}

class changeCurrent_State extends ShopState {}

class getLoding_State extends ShopState {}

class homesuccess_State extends ShopState {}

class homeerror_State extends ShopState {
  final error;
  homeerror_State(this.error);
}

class catsuccess_State extends ShopState {}

class caterror_State extends ShopState {
  final error;
  caterror_State(this.error);
}

class Favsuccess_State extends ShopState {}

class Faverror_State extends ShopState {
  final error;
  Faverror_State(this.error);
}
