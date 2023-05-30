import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/sign_data.dart';

abstract class ILoginRepository {
  /// fungsi ini digunakan untuk permintaan login ke server
  Future<Either<GenericException, bool>> login({required SignData signData});
}
