import 'package:fpdart/fpdart.dart';
import 'package:instagram_home_page/features/home/data/failures/feed_failure.dart';
import 'package:instagram_home_page/features/home/model/feed_model.dart';

class FeedRepository {
  Future<Either<FeedFailure, List<FeedModel>>> fetchFeed() async {
    await Future.delayed(Duration(seconds: 5));
  
    return Right([
      FeedModel(
        id: 1,
        userName: 'simran',
        userProfilePhoto: 'assets/stories/story_image_1.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_1.jpg',
        likeCount: 15,
        commentCount: 7,
        feedDescription: 'hello everyone 😃',
      ),
      FeedModel(
        id: 2,
        userName: 'dipika',
        userProfilePhoto: 'assets/stories/story_image_2.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_2.jpg',
        likeCount: 178,
        commentCount: 24,
        feedDescription: 'work-work-work 😶',
      ),
      FeedModel(
        id: 3,
        userName: 'riya',
        userProfilePhoto: 'assets/stories/story_image_3.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_3.jpg',
        likeCount: 40,
        commentCount: 7,
        feedDescription: 'enjoy the life 😃',
      ),
      FeedModel(
        id: 4,
        userName: 'tina',
        userProfilePhoto: 'assets/stories/story_image_4.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_4.jpg',
        likeCount: 240,
        commentCount: 30,
        feedDescription: 'eduction is weapon 🙂',
      ),
      FeedModel(
        id: 5,
        userName: 'karina',
        userProfilePhoto: 'assets/stories/story_image_5.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_5.jpg',
        likeCount: 200,
        commentCount: 40,
        feedDescription: 'work super hard 😑',
      ),
      FeedModel(
        id: 6,
        userName: 'aliya',
        userProfilePhoto: 'assets/stories/story_image_6.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_6.jpg',
        likeCount: 150,
        commentCount: 30,
        feedDescription: "what's going guys 😎",
      ),
      FeedModel(
        id: 7,
        userName: 'sameer',
        userProfilePhoto: 'assets/stories/story_image_7.jpg',
        postedTime: 123415,
        feedImage: 'assets/stories/story_image_7.jpg',
        likeCount: 100,
        commentCount: 20,
        feedDescription: 'hello world 😃',
      ),
    ]);
  }
}
