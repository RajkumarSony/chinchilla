import 'package:get/get.dart';
import 'package:customer_app/utils/dates.dart';

class EditSubsController extends GetxController {
  RxList items = [].obs;
  Rx<DateTime> nextDeliveryDate = leastPermittedDate.obs;
  Rx<DateTime> endDate = current.obs;

  void removeEndDate() {
    endDate.value = current;
  }

  void decreaseQuantity(String id) {
    final _item = items.firstWhere((element) => element["productID"] == id);
    final index = items.indexWhere((element) => element["productID"] == id);
    if (_item["quantity"] > 1) {
      items[index] = {
        "productID": _item["productID"],
        "quantity": _item["quantity"] - 1,
      };
    }
  }

  void increaseQuantity(String id) {
    final _item = items.firstWhere((element) => element["productID"] == id);
    final index = items.indexWhere((element) => element["productID"] == id);

    items[index] = {
      "productID": _item["productID"],
      "quantity": _item["quantity"] + 1,
    };
  }

  void setItem(List<dynamic> initialItems) {
    items.value = initialItems;
  }

  void setDates(String nextDate, String? lastDate) {
    nextDeliveryDate.value = DateTime.parse(nextDate);
    endDate.value = DateTime.parse(lastDate!);
  }

  int getQuantity(String id) {
    final _item = items.firstWhere((element) => element["productID"] == id);
    return _item["quantity"];
  }

  void selectStartDate(DateTime date) {
    if (date.difference(endDate.value).inHours > 0) {
      removeEndDate();
    }
    nextDeliveryDate.value = date;
  }
}
