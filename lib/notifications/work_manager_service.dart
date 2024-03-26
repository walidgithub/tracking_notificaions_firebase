import 'package:workmanager/workmanager.dart';

import 'local_notification_service.dart';
// steps
//1.init work manager
//2.excute our task.
//3.register our task in work manager

class WorkManagerService {
  void registerMyTask() async {
    //register my task
    await Workmanager().registerPeriodicTask(
      'id1',
      'show simple notification',
      // minimum time to repeat is 15 minutes
      frequency: const Duration(minutes: 15),
    );
  }

  //init work manager service
  /*
  we use Future<void> fff() async if we want to call this function and await it
  we use void fff() async if this function will take time to execute
  */
  Future<void> init() async {
    // isInDebugMode: true (is a report from work manger with success and you make it false)
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  //show notification
  Workmanager().executeTask((taskName, inputData) {
    LocalNotificationService.showDailySchduledNotification();
    // this function must return future<bool>
    return Future.value(true);
  });
}

//1.schedule notification at 9 pm.
//2.execute for this notification.
