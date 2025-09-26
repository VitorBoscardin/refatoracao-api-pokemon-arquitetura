class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({
    required this.name,
    required this.imageUrl,
  });

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] ?? '',
      imageUrl: map['sprites']?['front_default'] ?? '',
    );
  }
}
