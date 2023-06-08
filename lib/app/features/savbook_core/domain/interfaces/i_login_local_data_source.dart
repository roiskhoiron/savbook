import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';

abstract class ILoginLocalDataSource {
  /// fungsi ini digunakan untuk menyimpan token ke local storage
  Future<Either<GenericException, Unit>> saveToken({required String token});
}
