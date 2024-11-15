enum OrderState {
  pending,
  paid,
  shipping,
  processing,
  refunded,
  partialRefund,
  cancelled,
  completed
}

OrderState orderStateAsEnum(String state) {
  switch (state) {
    case 'pending':
      return OrderState.pending;
    case 'paid':
      return OrderState.paid;
    case 'shipping':
      return OrderState.shipping;
    case 'processing':
      return OrderState.processing;
    case 'refunded':
      return OrderState.refunded;
    case 'partialRefund':
      return OrderState.partialRefund;
    case 'cancelled':
      return OrderState.cancelled;
    case 'completed':
      return OrderState.completed;
    default:
      return OrderState.completed;
  }
}
