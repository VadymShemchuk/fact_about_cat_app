class FactModel {
  final String? catsFact;
  final String? imageUrl;

  FactModel({
    this.catsFact,
    this.imageUrl,
  });

  factory FactModel.copyWith(
    String catsFact,
    String imageUrl,
  ) {
    return FactModel(
      catsFact: catsFact,
      imageUrl: imageUrl,
    );
  }
}
