import 'package:movina/moves/domain/entity/Recommendation.dart';

class RecommendationModel extends Recommendation{
 const RecommendationModel({  super.backdropPath, required super.id});


 factory RecommendationModel.fromjson(Map<String,dynamic> json)=>
     RecommendationModel(backdropPath: json["backdrop_path"]?? "/bn3fAIckhOFEnrIZNCSbgHXRHLY.jpg", id: json["id"]);

}