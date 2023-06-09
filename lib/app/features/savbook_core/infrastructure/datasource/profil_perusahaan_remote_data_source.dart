import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/response/profil_perusahaan_response.dart';
import 'package:savbook/app/network/provider/api_provider.dart';

import '../../domain/interfaces/i_profil_perusahaan_remote_data_source.dart';

class ProfilPerusahaanRemoteDataSource
    extends IProfilPerusahaanRemoteDataSource {
  final apiProvider = Get.find<APIProvider>();

  @override
  Future<Either<GenericException, ProfilPerusahaanResponse>>
      getProfilPerusahaan() async {
    return await apiProvider
        .getData('/perusahaan/')
        .then((value) => value.fold((l) => Left(l), (res) {
              if (res.statusCode != 200) {
                return Left(ServerRequestException(
                    code: ExceptionCode.serverFailure,
                    value: res.data['error']));
              } else {
                return Right(ProfilPerusahaanResponse.fromJson(res.data));
              }
            }));
  }
}
