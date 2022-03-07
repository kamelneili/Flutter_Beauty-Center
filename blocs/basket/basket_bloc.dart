import 'package:beautycentre/models/basket_model.dart';
import 'package:beautycentre/models/delivery_time_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>(_onStartBasket);
    on<SelectDeliveryTime>(_onSelectDeliveryTime);
  }

  void _onSelectDeliveryTime(
    SelectDeliveryTime event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    Basket basket = new Basket();
    try {
      print('hi');
      print(event._selectedValue);
      print(basket.copyWith(deliveryTime: event.deliveryTime));
      emit(BasketLoaded(
          basket: basket.copyWith(
              deliveryTime: event.deliveryTime, date: event._selectedValue)));
    } catch (_) {}
  }

  void _onStartBasket(
    StartBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      // emit(
      //   BasketLoaded(
      //     basket: Basket(),
      //   ),
      // );
    } catch (_) {}
  }
}
  /*

  Stream<BasketState> mapEventToState(BasketEvent event) async* {
    if (event is StartBasket) {
      yield* _mapStartBasketToState();
    } else if (event is AddItem) {
      yield* _mapAddItemToState(event, state);
    } else if (event is RemoveItem) {
      yield* _mapRemoveItemToState(event, state);
    } else if (event is RemoveAllItem) {
      yield* _mapRemoveAllItemToState(event, state);
    } else if (event is ToggleSwitch) {
      yield* _mapToggleSwitchToState(event, state);
    } else if (event is AddVoucher) {
      yield* _mapAddVoucherToState(event, state);
    }
  }


  Stream<BasketState> _mapStartBasketToState() async* {
    yield BasketLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield BasketLoaded(basket: Basket());
    } catch (_) {}
  }

  Stream<BasketState> _mapAddItemToState(
      AddItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..add(event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveItemToState(
      RemoveItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..remove(event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveAllItemToState(
      RemoveAllItem event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)
                  ..removeWhere((item) => item == event.item)));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapToggleSwitchToState(
    ToggleSwitch event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(cutlery: !state.basket.cutlery));
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapAddVoucherToState(
      AddVoucher event, BasketState state) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(voucher: event.voucher));
      } catch (_) {}
    }
  }
  
}
*/
