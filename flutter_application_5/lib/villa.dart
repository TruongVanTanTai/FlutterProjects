class Villa {
  String? _villaName;
  String? _image;
  bool? _isIncludeBreakfast;
  int? _serviceLevel;
  double? _feedbackScore;
  int? _feedbackQuantity;
  String? _location;
  double? _distance;
  String? _description;
  String? _detailDescription;
  int? _price;
  bool? _isIncludeFee;

  Villa(
    this._villaName,
    this._image,
    this._isIncludeBreakfast,
    this._serviceLevel,
    this._feedbackScore,
    this._feedbackQuantity,
    this._location,
    this._distance,
    this._description,
    this._detailDescription,
    this._price,
    this._isIncludeFee,
  );

  String? get villaName => this._villaName;
  set villaName(String villaName) {
    this._villaName = villaName;
  }

  String? get image => this._image;
  set image(String image) {
    this.image = image;
  }

  bool? get isIncludeBreakfast => this._isIncludeBreakfast;
  set isIncludeBreakfast(bool isIncludeBreakfast) {
    this._isIncludeBreakfast = isIncludeBreakfast;
  }

  int? get serviceLevel => this._serviceLevel;
  set serviceLevel(int serviceLevel) {
    this._serviceLevel = serviceLevel;
  }

  double? get feedbackScore => this._feedbackScore;
  set feedbackScore(double feedbackScore) {
    this._feedbackScore = feedbackScore;
  }

  int? get feedbackQuantity => this._feedbackQuantity;
  set feedbackQuantity(int feedbackQuantity) {
    this._feedbackQuantity = feedbackQuantity;
  }

  String? get location => this._location;
  set location(String location) {
    this._location = location;
  }

  double? get distance => this._distance;
  set distance(double distance) {
    this._distance = distance;
  }

  String? get description => this._description;
  set description(String description) {
    this._description = description;
  }

  String? get detailDescription => this._detailDescription;
  set detailDescription(String detailDescription) {
    this._detailDescription = detailDescription;
  }

  int? get price => this._price;
  set price(int price) {
    this._price = price;
  }

  bool? get isIncludeFee => this._isIncludeFee;
  set isIncludeFee(bool isIncludeFee) {
    this._isIncludeFee = isIncludeFee;
  }
}
