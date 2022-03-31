import 'dart:convert';

import 'package:milk_tea/models-interface/feedback.interface.dart';
import 'package:milk_tea/models/feedback.model.dart';

class FeedbackMapping {
  dynamic MapServiceFeedback(FeedbackModel model) {
    FeedbackInterface feedback = FeedbackInterface();
    feedback.content = model.content;
    feedback.star = model.star;
    feedback.productId = model.productId;
    feedback.userId = model.userId;

    return json.encode(feedback.toJson());
  }
}
