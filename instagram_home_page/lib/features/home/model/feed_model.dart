class FeedModel {
  final int id;
  final String userName;
  final String userProfilePhoto;
  final int postedTime;
  final String feedImage;
  final String feedDescription;
  final int likeCount;
  final int commentCount;

  const FeedModel({
    required this.id,
    required this.userName,
    required this.userProfilePhoto,
    required this.postedTime,
    required this.feedImage,
    required this.likeCount,
    required this.commentCount,
    required this.feedDescription,
  });
}
