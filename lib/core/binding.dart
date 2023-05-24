import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../app/network/provider/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(APIProvider(baseUrl: dotenv.get('BASE_URL')));
  }
}
