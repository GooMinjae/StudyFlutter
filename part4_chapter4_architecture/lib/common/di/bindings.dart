import 'package:fast_app_base/data/data.dart';
import 'package:fast_app_base/domain/domain.dart';
import 'package:fast_app_base/presentation/main/tab/controller/todo_controller.dart';
import 'package:get/get.dart';

/// **get_it**
/// **GetX**
class TodoBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: temp
    /// remote
    // Get.put<TodoApi>(TodoApi());
    // Get.put<TodoRepository>(TodoRemoteRepository());
    // Get.to();
    // Get.find() ..

    /// 순서 보장 되어야 함 - 순서 중요
    /// local
    Get.put<TodoDB>(TodoDB());

    /// repository
    Get.put<TodoRepository>(TodoLocalRepository());
    // Get.put<TodoRepository>(TodoLocalRepository(Get.find()));

    /// constroller
    Get.put<TodoController>(TodoController());
  }
}
