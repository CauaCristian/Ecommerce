import '../models/menu_Model.dart';
class ControllerMenu {
  final MenuModel _menuModel = MenuModel();
  List get menu {
    return _menuModel.menu;
  }
}
