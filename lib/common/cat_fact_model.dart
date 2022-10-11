class CatFactModel {
  final String? catsFact;
  final String? imageUrl;

  CatFactModel({
    this.catsFact,
    this.imageUrl,
  });

  factory CatFactModel.copyWith(
    String? catsFact,
    String? imageUrl,
  ) {
    return CatFactModel(
      catsFact: catsFact,
      imageUrl: imageUrl,
    );
  }
}
