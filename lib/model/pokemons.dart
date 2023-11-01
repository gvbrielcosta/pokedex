class Pokemon {
  List<String>? weakness;
  String? number;
  String? collectiblesSlug;
  String? featured;
  String? slug;
  String? description;
  String? name;
  String? thumbnailAltText;
  String? thumbnailImage;
  List<String>? type;

  Pokemon({this.weakness, this.number, this.collectiblesSlug, this.featured, this.slug, this.description, this.name, this.thumbnailAltText, this.thumbnailImage, this.type});

  Pokemon.fromJson(Map<String, dynamic> json) {
    weakness = json['weakness'].cast<String>();
    number = json['number'];
    collectiblesSlug = json['collectibles_slug'];
    featured = json['featured'];
    slug = json['slug'];
    description = json['description'] == '' ? 'A API não disponibilizou essa informação.' : json['description'];
    name = json['name'];
    thumbnailAltText = json['thumbnailAltText'];
    thumbnailImage = json['thumbnailImage'];
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weakness'] = weakness;
    data['number'] = number;
    data['collectibles_slug'] = collectiblesSlug;
    data['featured'] = featured;
    data['slug'] = slug;
    data['description'] = description;
    data['name'] = name;
    data['thumbnailAltText'] = thumbnailAltText;
    data['thumbnailImage'] = thumbnailImage;
    data['type'] = type;
    return data;
  }
}
