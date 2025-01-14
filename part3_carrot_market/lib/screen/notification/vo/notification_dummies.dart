import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/notification/vo/notification_type.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

final notification1 = DaangnNotification(
    NotificationType.official,
    '📭8월 가계부가 도착했어요!',
    '#당근 #당근가계부 #자원재순환 #따뜻한거래',
    DateTime.now().subtract(3.hours));

final notification2 = DaangnNotification(
    NotificationType.legal,
    '당근페이 전자금융거래 이용약관 개정 안내',
    '개정사항 확인하기(2023년 10월 1일 적용)',
    DateTime.now().subtract(3.days));

final notification3 = DaangnNotification(
    NotificationType.official,
    "가족집수리 업체를 이용해보셨나요?\n"
        "따뜻한 후기를 남겨주세요~",
    '',
    DateTime.now().subtract(4.days));

final notification4 = DaangnNotification(
    NotificationType.local,
    "지금 새로워진 '당근'을 만나보세요.🥕",
    '핑구밍님, 당근마켓의 새 이름 새 로고를 소개할게요!',
    DateTime.now().subtract(7.days));

final notification5 = DaangnNotification(NotificationType.official,
    '👀핑구밍님 금주의 인기매물, 지금 만나보세요!', '', DateTime.now().subtract(7.days));

final notification6 = DaangnNotification(
    NotificationType.official,
    '📭8월 가계부가 도착했어요!',
    '#당근 #당근가계부 #자원재순환 #따뜻한거래',
    DateTime.now().subtract(14.days));

final notificationList = [
  notification1,
  notification2,
  notification3,
  notification4,
  notification5,
  notification6,
];
