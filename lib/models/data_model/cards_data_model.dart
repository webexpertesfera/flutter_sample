class CardsDataModel {
  int? id;
  String? name;
  String? amount;
  String? description;
  dynamic image;
  String? type;
  dynamic path;
  dynamic categoryName;
  dynamic categoryImage;
  dynamic thumbNail;
  String? expDate;
  dynamic isScratched;
  dynamic ageGroup;
  dynamic difficultyType;
  dynamic cost;
  dynamic gender;

  CardsDataModel(
      {this.id,
        this.name,
        this.amount,
        this.description,
        this.categoryName,
        this.image,
        this.categoryImage,
        this.type,
        this.path,
        this.ageGroup,
        this.difficultyType,
        this.cost,
        this.gender,
        this.thumbNail,
        this.isScratched,
        this.expDate});

  CardsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    description = json['description'];
    image = json['image'];
    type = json['type'];
    path = json['path'];
    ageGroup = json['age_group'];
    difficultyType = json['difficulty_type'];
    cost = json['cost'];
    gender = json['gender'];
    categoryImage = json['category_image'];
    categoryName = json['category_name'];

    expDate = json['exp_date'];
    isScratched = json['is_scratched'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['age_group'] = this.ageGroup;
    data['difficulty_type'] = this.difficultyType;
    data['cost'] = this.cost;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['category_image'] = this.categoryImage;
    data['category_name'] = this.categoryName;
    data['type'] = this.type;
    data['path'] = this.path;
    data['exp_date'] = this.expDate;
    data['is_scratched'] = this.isScratched;
    return data;
  }
}