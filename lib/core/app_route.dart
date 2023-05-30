import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/presentation/dashboard/dashboard_ui.dart';
import 'package:savbook/app/features/savbook_core/presentation/login/login_binding.dart';
import 'package:savbook/app/features/savbook_core/presentation/login/login_ui.dart';

import '../app/features/savbook_core/presentation/dashboard/dashboard_binding.dart';

class AppRouter {
  static const initial = LoginUi.routeName;

  static final routes = GetPage(
    name: initial,
    page: () => LoginUi(),
    binding: LoginBinding(),
    children: [
      GetPage(
          name: DashboardUi.routeName,
          page: () => DashboardUi(),
          binding: DashboardBinding()),
    ],
  );

  static String findRoute(String page) {
    GetPage? foundNode = GetRouteTree.findNode(routes, page);

    if (foundNode == null) {
      return '';
    }

    List<GetPage> trace = [];
    GetRouteTree.buildTrace(routes, foundNode, trace);

    // mencetak laporan jejak node
    return GetRouteTree.printTrace(trace);
  }
}

/// It finds the node with the given data and prints the trace of the node
class GetRouteTree {
  static GetPage? findNode(GetPage node, String data) {
    if (node.name == data) {
      return node;
    } else if (node.children.isNotEmpty) {
      for (GetPage child in node.children) {
        GetPage? result = findNode(child, data);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }

  static void buildTrace(GetPage node, GetPage foundNode, List<GetPage> trace) {
    trace.add(node);
    if (node == foundNode) {
      return;
    }
    for (GetPage child in node.children) {
      buildTrace(child, foundNode, trace);
      if (trace.last == foundNode) {
        return;
      }
    }
    trace.removeLast();
  }

  static String printTrace(List<GetPage> trace) {
    // print('Laporan jejak node:');
    var path = '';
    for (int i = 0; i < trace.length; i++) {
      // print('${i + 1}. ${trace[i].data}');
      path += trace[i].name;
    }

    return path;
  }
}
