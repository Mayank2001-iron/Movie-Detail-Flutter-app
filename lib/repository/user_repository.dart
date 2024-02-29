import 'package:movies3/Models/homeModel.dart';
import 'package:movies3/provider/dataProvider.dart';

abstract class IUserRepository {
  Future<List<HomeModel>> getData();
}

class UserRepository implements IUserRepository {
  final DataProvider dataProvider;
  UserRepository({required this.dataProvider});
  @override
  Future<List<HomeModel>> getData() {
    return dataProvider.getData();
  }
}
