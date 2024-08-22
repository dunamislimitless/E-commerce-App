abstract class CombinedEvent {}

class IncrementEvent extends CombinedEvent {
  final int index;
  IncrementEvent(this.index);
}

class DecrementEvent extends CombinedEvent {
  final int index;
  DecrementEvent(this.index);
}

class RemoveCartItemEvent extends CombinedEvent {
  final int index;
  RemoveCartItemEvent(this.index);
}
