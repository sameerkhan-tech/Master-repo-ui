class StoryModel {
  final int id;
  final String userName;
  final String thumbnailPicture;
  final List<String> stories;

  StoryModel({
    required this.id,
    required this.userName,
    required this.thumbnailPicture,
    required this.stories,
  });

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'],
      userName: map['user_name'],
      thumbnailPicture: map['thumbnail_picture'],
      stories: map['stories'],
    );
  }
}
