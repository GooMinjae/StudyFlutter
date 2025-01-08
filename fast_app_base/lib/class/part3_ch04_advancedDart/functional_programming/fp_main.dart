import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';

import '../../../screen/main/tab/home/vo/vo_bank_account.dart';

main() {
  //functional programming

  // 프로그래밍 방법을 부르는 이름들

// Beta 코딩 (동작 x) account dummy 내에 id도 없음
  // 절차적 프로그래밍 - 명령형 프로그래밍
  // Accounts => Users => User.name => 출력
  // final accounts = getAccounts();
  // final list = <String>[];
  // for (final accounts in accounts) {
  //   final user = getUser(accounts.userId);
  //   list.add(user);
  // }
  // print(list);

  // // 함수형 프로그래밍 - 선언형 프로그래밍
  // final nameList = getAccounts()
  //     .map((accounts) => accounts.userId)
  //     .map((userId) => getUser(userId))
  //     .map((user) => user.name)
  //     .toList();
  // print(nameList);
  // // 같은 결과
}

List<BankAccount> getAccounts() {
  return bankAccounts;
}
