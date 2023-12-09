class Category {
  List<Categories>? categories;

  Category({
    this.categories,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['categories'] = categories?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'] as String?;
    strCategory = json['strCategory'] as String?;
    strCategoryThumb = json['strCategoryThumb'] as String?;
    strCategoryDescription = json['strCategoryDescription'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idCategory'] = idCategory;
    json['strCategory'] = strCategory;
    json['strCategoryThumb'] = strCategoryThumb;
    json['strCategoryDescription'] = strCategoryDescription;
    return json;
  }
}