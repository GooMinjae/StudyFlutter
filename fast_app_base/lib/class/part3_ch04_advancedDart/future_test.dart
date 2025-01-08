import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() async {
  // Future 기본 개념
  /// 시간이 걸리는 comutation 작업 또는 유저의 응답을 기다려야되는 상태

  // Future 의 생성과 수행
  print('start');
  final account = await getBankAccounts(); // Future 수행, 수행할때까지 기다림
  // 동기
  // getBankAccounts().then((value) {
  //   print(value.toString());
  // });
  print(account.toString());
  print('end');
  // -> start -> 2초 후에 정보 가져 온 후 end

  // Future Timeout
  print('start');
  final result = await getBankAccounts()
      .timeout(1.seconds)
      .onError((error, stackTrace) => []);
  print('end');

  // Future Error handling
  /// try catch - await
  print('start');
  try {
    final result2 = await getBankAccounts().timeout(1.seconds);
  } catch (e) {
    print(e);
  }
  print('end');

  /// try catch - then
  print('start');
  getBankAccounts().timeout(1.seconds).then((value) {
    print(value);
  }).catchError((error, stackTrace) {
    print(error);
    print(stackTrace);
  });
  print('end');

  // FutureOr
}

abstract class DoWorkInterface {
  FutureOr doWork();
}

class SyncWork extends DoWorkInterface {
  @override
  void doWork() {}
}

class AsyncWork extends DoWorkInterface {
  @override
  Future doWork() async {}
}

//
Future<List<BankAccount>?> getBankAccounts() async {
  await sleepAsync(2.seconds);
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
