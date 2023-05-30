import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/email.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/password.dart';

import '../domain/interfaces/i_login_factory.dart';
import '../domain/interfaces/i_login_repository.dart';
import '../infrastructure/login_factory.dart';
import '../infrastructure/repository/login_repository.dart';

class LoginAppService {
  final ILoginFactory _factory = Get.find<LoginFactory>();
  final ILoginRepository _repository = Get.find<LoginRepository>();

  login({required String email, required String psw}) async {
    final signIn = _factory.signIn(email: Email(email), psw: Password(psw));

    if (!signIn.validate()) {
      // gagal login karena tidak tervalidasi
      return;
    }

    // lanjut ke infrastrukture login
    final result = await _repository.login(signData: signIn);
  }
}
