
abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}
class FilterProductsByCategory extends ProductEvent {
  final String category;

  FilterProductsByCategory(this.category);
}