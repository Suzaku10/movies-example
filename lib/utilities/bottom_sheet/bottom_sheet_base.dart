import 'package:mobx/mobx.dart';
import 'package:movies_example/utilities/constant_utilities.dart';

part 'bottom_sheet_base.g.dart';

class BottomSheetHelper = BottomSheetBase with _$BottomSheetHelper;

abstract class BottomSheetBase with Store {
  @observable
  ObservableList<Map<String, dynamic>> genres = ObservableList.of(
      ConstantUtilities.listSavedGenre == null
          ? ConstantUtilities().moviesGenre
          : ConstantUtilities.listSavedGenre!);

  @action
  void setFlag(bool status, int id) {
    List<Map<String, dynamic>> selected = genres;
    selected.where((element) => element["id"] == id).single['status'] = status;

    genres = ObservableList.of(selected);
  }
}
