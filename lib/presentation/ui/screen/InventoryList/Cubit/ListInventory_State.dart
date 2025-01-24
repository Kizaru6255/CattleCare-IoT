abstract class ListInventoryState{}


class GetAllData extends ListInventoryState {
  final List<dynamic> listInventory;
  GetAllData(this.listInventory);
}

class LoadingState extends ListInventoryState {}

class ErrorState extends ListInventoryState {
  final String errorMessage ;
  ErrorState(this.errorMessage);
}


//   UP Comming  Data Search

class Search_and_GetData extends ListInventoryState{}

class Search_and_NowAvailableData extends ListInventoryState{}



//   ------------- and can be so on ----------------- 