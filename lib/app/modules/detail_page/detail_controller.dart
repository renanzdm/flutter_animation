import 'package:mobx/mobx.dart';

part 'detail_controller.g.dart';

class DetailController = _DetailPageControllerBase with _$DetailController;

abstract class _DetailPageControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
