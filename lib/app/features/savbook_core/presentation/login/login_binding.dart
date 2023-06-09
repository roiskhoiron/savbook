import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/application/login_app_service.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/datasource/login_local_data_source.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/datasource/login_remote_data_source.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/factories/login_factory.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/repository/login_repository.dart';

import 'login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    /*MODULE SAVBOOK_CORE*/
    // infrastructure dependencies
    Get.put(LoginRemoteDataSource());
    Get.put(LoginLocalDataSource());
    Get.put(LoginFactory());
    Get.put(LoginRepository());
    // aplication dependencies
    Get.put(LoginAppService());
    // presentation dependencies
    Get.lazyPut(() => LoginLogic());
  }
}
