class Project {
  const Project({
    required this.id,
    required this.name,
    required this.tags,
    required this.tools,
    required this.briefDescription,
    required this.description,
    required this.iconUrl,
    required this.mockupUrl,
    this.appStoreUrl,
    this.playStoreUrl,
  });

  final String id;
  final String name;
  final List<String> tools;
  final String tags;
  final String briefDescription;
  final String description;
  final String iconUrl;
  final String mockupUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;
}
