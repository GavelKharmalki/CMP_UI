class CustomCardData {
  final String text;
  final String imageUrl;

  CustomCardData({
    required this.text,
    required this.imageUrl,
  });

  factory CustomCardData.fromJson(Map<String, dynamic> json) {
    return CustomCardData(
      text: json['text'],
      imageUrl: json['imageUrl'],
    );
  }
}

List<CustomCardData> customCardData = [
  CustomCardData(
    text: 'Default Platters',
    imageUrl:
        'assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png',
  ),
  CustomCardData(
    text: 'Craft Your Own',
    imageUrl:
        'assets/traditional-indian-soup-lentils-indian-dhal-spicy-curry-bowl-spices-herbs-rustic-black-wooden-table.png',
  ),
];
