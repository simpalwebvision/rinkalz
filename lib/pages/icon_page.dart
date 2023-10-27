import 'package:myapp/pages/ChangeNotifier.dart';

void toggleFavorite(Product product) {
  setState(() {
    var favoriteProductIds;
    if (favoriteProductIds.contains(product.id)) {
      var favoriteProductIds;
      favoriteProductIds.remove(product.id);
    } else {
      favoriteProductIds.add(product.id);
    }
  });
}

void setState(Null Function() param0) {}

bool isFavorite(Product product) {
  var favoriteProductIds;
  return favoriteProductIds.contains(product.id);
}
