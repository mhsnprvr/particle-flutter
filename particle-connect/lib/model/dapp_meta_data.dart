class DappMetaData {
  String name;
  String icon;
  String url;
  String description;

  DappMetaData(this.name, this.icon, this.url, this.description);

  DappMetaData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        icon = json['icon'],
        url = json['url'],
        description = json ['description'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'icon': icon, 'url': url, 'description': description};
}
