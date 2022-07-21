class ListLenghtHelper {
  static double? itemsToLenght(
    List<dynamic> list,
    int itemsLine,
    int lenghtCard,
  ) {
    if (list.length / itemsLine > 1) {
      if (list.length % itemsLine != 0) {
        return (((list.length ~/ itemsLine) + 1) * lenghtCard).toDouble();
      }

      return ((list.length ~/ itemsLine) * lenghtCard).toDouble();
    }
    return lenghtCard.toDouble();
  }
}
