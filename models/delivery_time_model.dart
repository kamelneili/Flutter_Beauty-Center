import 'package:equatable/equatable.dart';

class DeliveryTime extends Equatable {
  final int id;
  final String value;
  final DateTime time;
  DeliveryTime({
    required this.id,
    required this.value,
    required this.time,
  });
  @override
  List<Object?> get props => [id, value, time];
  static List<DeliveryTime> deliveryTimes = [
    DeliveryTime(
      id: 1,
      value: '08:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        0,
      ),
    ),
    DeliveryTime(
      id: 2,
      value: '08:30pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        20,
      ),
    ),
    DeliveryTime(
      id: 3,
      value: '09:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        30,
      ),
    ),
    DeliveryTime(
      id: 4,
      value: '10:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        40,
      ),
    ),
    DeliveryTime(
      id: 5,
      value: '11:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        50,
      ),
    ),
    DeliveryTime(
      id: 6,
      value: '12:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
    DeliveryTime(
      id: 7,
      value: '14:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
    DeliveryTime(
      id: 8,
      value: '15:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
    DeliveryTime(
      id: 9,
      value: '16:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
    DeliveryTime(
      id: 10,
      value: '17:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
    DeliveryTime(
      id: 11,
      value: '18:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
    DeliveryTime(
      id: 12,
      value: '19:00pm',
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20,
        60,
      ),
    ),
  ];
}
