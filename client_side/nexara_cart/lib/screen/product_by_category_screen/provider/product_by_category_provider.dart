import 'package:flutter/cupertino.dart';

import '../../../core/data/data_provider.dart';
import '../../../models/brand.dart';
import '../../../models/category.dart';
import '../../../models/product.dart';
import '../../../models/sub_category.dart';
import '../../../utility/constants.dart';

class ProductByCategoryProvider extends ChangeNotifier {
  final DataProvider _dataProvider;
  Category? mySelectedCategory;
  SubCategory? mySelectedSubCategory;
  List<SubCategory> subCategories = [];
  List<Brand> brands = [];
  List<Brand> selectedBrands = [];
  List<Product> filteredProduct = [];

  ProductByCategoryProvider(this._dataProvider);

  filterInitialProductAndSubCategory(Category selectedCategory) {
    mySelectedCategory = selectedCategory;
    subCategories = _dataProvider.subCategories
        .where((element) => element.categoryId?.sId == selectedCategory.sId)
        .toList();
    subCategories.insert(0, SubCategory(name: CATEGORY_ALL));
    mySelectedSubCategory = subCategories[0];
    filteredProduct = _dataProvider.products
        .where((element) => element.proCategoryId?.sId == selectedCategory.sId)
        .toList();
    notifyListeners();
  }

  filterProductBySubCategory(SubCategory subCategory) {
    mySelectedSubCategory = subCategory;

    if (subCategory.name == CATEGORY_ALL) {
      filteredProduct = _dataProvider.products
          .where(
            (element) => element.proCategoryId?.sId == mySelectedCategory?.sId,
          )
          .toList();
      brands = [];
    } else {
      filteredProduct = _dataProvider.products
          .where((element) => element.proSubCategoryId?.sId == subCategory.sId)
          .toList();
      brands = _dataProvider.brands
          .where((element) => element.subcategoryId?.sId == subCategory.sId)
          .toList();
    }

    notifyListeners();
  }

  void filterProductByBrand() {
    if (selectedBrands.isEmpty) {
      filteredProduct = _dataProvider.products
          .where(
            (element) =>
                element.proSubCategoryId?.sId == mySelectedSubCategory?.sId,
          )
          .toList();
    } else {
      filteredProduct = _dataProvider.products
          .where(
            (product) =>
                product.proSubCategoryId?.sId == mySelectedSubCategory?.sId &&
                selectedBrands.any(
                  (brand) => product.proBrandId?.sId == brand.sId,
                ),
          )
          .toList();
    }

    notifyListeners();
  }

  // // Thuật toán sắp xếp TimSort
  // void sortProducts({required bool ascending}) {
  //   filteredProduct.sort((a, b) {
  //     if (ascending) {
  //       return a.price!.compareTo(b.price ?? 0);
  //     } else {
  //       return b.price!.compareTo(a.price ?? 0);
  //     }
  //   });

  //   notifyListeners();
  // }

  // Hàm sortProducts dùng để sắp xếp danh sách sản phẩm theo giá.
  // Dart sử dụng thuật toán TimSort (kết hợp Merge Sort và Insertion Sort) cho phương thức .sort().
  // - Nếu ascending = true: sắp xếp tăng dần (giá thấp -> cao).
  // - Nếu ascending = false: sắp xếp giảm dần (giá cao -> thấp).
  // Sau khi sắp xếp xong, notifyListeners() được gọi để cập nhật lại giao diện UI.

  void sortProducts({required bool ascending}) {
    filteredProduct.sort((a, b) {
      if (ascending) {
        // So sánh giá sản phẩm để sắp xếp tăng dần
        return a.price!.compareTo(b.price ?? 0);
      } else {
        // So sánh giá sản phẩm để sắp xếp giảm dần
        return b.price!.compareTo(a.price ?? 0);
      }
    });

    // Thông báo cho UI biết dữ liệu đã thay đổi để vẽ lại màn hình
    notifyListeners();
  }

  void updateUI() {
    notifyListeners();
  }
}
