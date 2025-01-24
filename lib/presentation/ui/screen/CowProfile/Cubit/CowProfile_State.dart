abstract class CowListState {}

class LoadingState extends CowListState {}

class GetAllData extends CowListState {
  final List<dynamic> listInventory;
  GetAllData(this.listInventory);
}

class ErrorMessage extends CowListState {}

class ErrorState extends CowListState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
