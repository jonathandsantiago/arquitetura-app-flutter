class ListHelper {
  static List<E> growableToList<E>(List<dynamic> listDynamic) {
    return List<E>.from(listDynamic, growable: false);
  }
}
