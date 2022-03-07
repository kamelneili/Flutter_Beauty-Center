part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class SelectDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;
  final DateTime _selectedValue;
  const SelectDeliveryTime(this.deliveryTime, this._selectedValue);
  @override
  List<Object> get props => [deliveryTime];
}
