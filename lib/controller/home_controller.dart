 
import 'package:wednusday_solutions/model/home_model.dart';
import 'package:wednusday_solutions/services/home_services.dart';

class HomeController {
  final List<ItemsModel> modelList = [];
  bool isLoading = false;
  ////////////// Fetch Data //////////////
  Future<void> getData() async {
    final List<ItemsModel>? result = await HomeService.getData();
    if (result != null) {
      modelList.clear();
      modelList.addAll(result);
    }
  }
}
