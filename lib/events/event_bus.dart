import 'package:event_bus/event_bus.dart';
import '../model/goods_model.dart';

final EventBus eventBus = EventBus();


class ShowBottomSheetEvent {
  ShowBottomSheetEvent();
}

class AddCartEvent {
  GoodsModel? goods;
  AddCartEvent({this.goods});
}
