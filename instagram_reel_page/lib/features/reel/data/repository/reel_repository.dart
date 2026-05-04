import 'package:fpdart/fpdart.dart';
import 'package:instagram_reel_page/features/reel/data/failures/reel_failure.dart';
import 'package:instagram_reel_page/features/reel/model/reel_model.dart';

class ReelRepository {
  Future<Either<ReelFailure, List<ReelModel>>> fetchReels() async {
    await Future.delayed(Duration(seconds: 3));
    return Right([
      ReelModel(id: 1,
      video:'assets/videos/body_transformation_video.mp4' ,
      commentCount: 30,
      description:'Trust the process' ,
      likeCount:1000 ,
      saves: 100),


        ReelModel(id: 2,
      video:'assets/videos/gym_reel_video.mp4' ,
      commentCount: 20,
      description:'Gym rat 😎' ,
      likeCount:503 ,
      saves: 40),
      
        ReelModel(id: 3,
      video:'assets/videos/motivation_video.mp4' ,
      commentCount: 30,
      description:'Consistency is key' ,
      likeCount:900 ,
      saves: 100),

        ReelModel(id: 4,
      video:'assets/videos/study_motivation_video.mp4' ,
      commentCount: 30,
      description:'Study super hard 😶' ,
      likeCount:1000 ,
      saves: 100),

        ReelModel(id: 5,
      video:'assets/videos/landscape_video.mp4' ,
      commentCount: 10,
      description:'Nature ♥' ,
      likeCount:100 ,
      saves: 10),
    ]);
  }
}

 