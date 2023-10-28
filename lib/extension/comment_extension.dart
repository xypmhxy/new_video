/*
* 作者 Ren
* 时间  2023/10/12 20:17
*/
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
extension CommentListExtension on CommentsList{
  String formatTotalCount(){
    if (totalLength >= 1000000) {
      final likeK = (totalLength / 1000000).toStringAsFixed(1);
      return '${likeK}M';
    } else if (totalLength >= 10000) {
      final likeK = (totalLength / 1000).toStringAsFixed(1);
      return '${likeK}K';
    } else if (totalLength >= 1000) {
      final likeK = (totalLength / 1000).toStringAsFixed(1);
      return '${likeK}K';
    }
    return '$totalLength';
  }
}
extension CommentExtension on Comment{
  String formatLikeCount(){
    if (likeCount >= 1000000) {
      final likeK = (likeCount / 1000000).toStringAsFixed(1);
      return '${likeK}M';
    } else if (likeCount >= 10000) {
      final likeK = (likeCount / 1000).toStringAsFixed(1);
      return '${likeK}K';
    } else if (likeCount >= 1000) {
      final likeK = (likeCount / 1000).toStringAsFixed(1);
      return '${likeK}K';
    }
    return '$likeCount';
  }

  String formatReplyCount(){
    if (replyCount >= 1000000) {
      final likeK = (replyCount / 1000000).toStringAsFixed(1);
      return '${likeK}M';
    } else if (replyCount >= 10000) {
      final likeK = (replyCount / 1000).toStringAsFixed(1);
      return '${likeK}K';
    } else if (replyCount >= 1000) {
      final likeK = (replyCount / 1000).toStringAsFixed(1);
      return '${likeK}K';
    }
    return '$replyCount';
  }

}