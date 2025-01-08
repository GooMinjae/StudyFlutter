import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 =
    BankAccount(bankShinhan, 30000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 =
    BankAccount(bankShinhan, 20000000, accountTypeName: "저축예금");
final bankAccountShinhan3 =
    BankAccount(bankShinhan, 2000000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(bankKakao, 200000);
final bankAccountKakao =
    BankAccount(bankKakao, 3000000, accountTypeName: "입출금통장");

// main(){

//   for(final item in bankAccounts){
//     print(item.accountTypeName);
//   }

//   final shinhanBank = bankMap["shinhan1"];
//   for(final entry in bankMap.entries){
//     print(entry.key + ":" + (entry.value.accountTypeName ?? entry.value.bank.name));
//   }

//   bankAccounts.contains(bankAccountShinhan1);
//   bankSet.contains(bankAccountShinhan1); // True / False
//   // -> List, Set 모두 사용 가능하지만, 시간 복잡도가 다름
//   // 시간복잡도 List: O(n), Set: O(1)
//   // List 가 길수록 Set을 사용하는 것이 유리 (List: 한번씩 모두 확인/Set: 한번에 확인)

//   bankAccounts.toSet();
//   bankSet.toList();
// }

// List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
];

// Map
final bankMap = {
  // key: value,
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
  "shinhan3": bankAccountShinhan3,
  "toss": bankAccountToss,
  "kakao": bankAccountKakao,
};

// Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
};
