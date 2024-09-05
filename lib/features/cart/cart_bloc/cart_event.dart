abstract class CombinedEvent {}

class IncrementEvent extends CombinedEvent {
  final String id;
  IncrementEvent(this.id);
}

class DecrementEvent extends CombinedEvent {
  final String id;
  DecrementEvent(this.id);
}

class RemoveCartItemEvent extends CombinedEvent {
  final String id;
  RemoveCartItemEvent(this.id);
}

