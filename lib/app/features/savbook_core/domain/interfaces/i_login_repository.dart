import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/auth_token_data.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/sign_data.dart';

abstract class ILoginRepository {
  /// fungsi ini digunakan untuk permintaan login ke repository server
  Future<Either<GenericException, String>> login({required SignData signData});

  /// fungsi ini digunakan untuk menyimpan token ke local storage
  Future<Either<GenericException, Unit>> saveToken(
      {required AuthToken authToken});
}
