import 'package:fpdart/fpdart.dart';
import 'package:instagram_home_page/features/home/data/failures/story_failure.dart';
import 'package:instagram_home_page/features/home/model/story_model.dart';

class StoryRepository {
  Future<Either<StoryFailure, List<StoryModel>>> fetchStories() async {
    await Future.delayed(Duration(seconds: 3));
    return Right([
      StoryModel(
        id: 1,
        userName: 'simran',
        thumbnailPicture:
            'assets/stories/story_image_1.jpg',
        stories: [],
      ),
      StoryModel(
        id: 2,
        userName: 'dipika',
        thumbnailPicture:
            'assets/stories/story_image_2.jpg',
        stories: [],
      ),
      StoryModel(
        id: 3,
        userName: 'riya',
        thumbnailPicture:
            'assets/stories/story_image_3.jpg',
        stories: [],
      ),
      StoryModel(
        id: 4,
        userName: 'tina',
        thumbnailPicture:
            'assets/stories/story_image_4.jpg',
        stories: [],
      ),
      StoryModel(
        id: 5,
        userName: 'karina',
        thumbnailPicture:
            'assets/stories/story_image_5.jpg',
        stories: [],
      ),
      StoryModel(
        id: 6,
        userName: 'aliya',
        thumbnailPicture:
            'assets/stories/story_image_6.jpg',
        stories: [],
      ),
      StoryModel(
        id: 7,
        userName: 'sameer',
        thumbnailPicture:
            'assets/stories/story_image_7.jpg',
        stories: [],
      ),
      StoryModel(
        id: 8,
        userName: 'sija',
        thumbnailPicture:
            'assets/stories/story_image_8.jpg',
        stories: [],
      ),
      StoryModel(
        id: 9,
        userName: 'ajay',
        thumbnailPicture:
            'assets/stories/story_image_9.jpg',
        stories: [],
      ),
      StoryModel(
        id: 10,
        userName: 'siya',
        thumbnailPicture:
            'assets/stories/story_image_10.jpg',
        stories: [],
      ),
    ]);
  }
}
