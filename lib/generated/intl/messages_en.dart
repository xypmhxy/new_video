// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(params, params1) =>
      "downloading: ${params}  - complete: ${params1}";

  static String m1(params) => "${params} videos";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToPlaylistFailed":
            MessageLookupByLibrary.simpleMessage("Added failed"),
        "addToPlaylistSuccess":
            MessageLookupByLibrary.simpleMessage("Added successfully"),
        "addWatchLaterSuccess":
            MessageLookupByLibrary.simpleMessage("Added to watch later"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "audio": MessageLookupByLibrary.simpleMessage("Audio"),
        "backPressedConfirm": MessageLookupByLibrary.simpleMessage(
            "Please click again to exit to desktop"),
        "backgroundPlayback":
            MessageLookupByLibrary.simpleMessage("Background"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "clearHistory": MessageLookupByLibrary.simpleMessage("Clear history"),
        "comments": MessageLookupByLibrary.simpleMessage("Comments"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this video?"),
        "confirmDeleteHistory": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this video\'s history?"),
        "continueAll": MessageLookupByLibrary.simpleMessage("Continue all"),
        "cover": MessageLookupByLibrary.simpleMessage("Cover"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("Delete Failed"),
        "dislike": MessageLookupByLibrary.simpleMessage("Dislike"),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "downloaded": MessageLookupByLibrary.simpleMessage("Downloaded"),
        "downloading": MessageLookupByLibrary.simpleMessage("Downloading"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "exportCover": MessageLookupByLibrary.simpleMessage("Export cover"),
        "exportVideo": MessageLookupByLibrary.simpleMessage("Export video"),
        "file": MessageLookupByLibrary.simpleMessage("File"),
        "folder": MessageLookupByLibrary.simpleMessage("Folder"),
        "free": MessageLookupByLibrary.simpleMessage("Free"),
        "getPlaySourceFailed": MessageLookupByLibrary.simpleMessage(
            "Failed to obtain playback information"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "libDownloadCount": m0,
        "library": MessageLookupByLibrary.simpleMessage("Library"),
        "like": MessageLookupByLibrary.simpleMessage("Like"),
        "likedVideos": MessageLookupByLibrary.simpleMessage("Liked Videos"),
        "live": MessageLookupByLibrary.simpleMessage("Live"),
        "loop": MessageLookupByLibrary.simpleMessage("Loop"),
        "mostLike": MessageLookupByLibrary.simpleMessage("Most like"),
        "mostReplies": MessageLookupByLibrary.simpleMessage("Most Replies"),
        "movie": MessageLookupByLibrary.simpleMessage("Movie"),
        "newPlaylist": MessageLookupByLibrary.simpleMessage("New Playlist"),
        "newest": MessageLookupByLibrary.simpleMessage("Newest"),
        "noData": MessageLookupByLibrary.simpleMessage("No video found"),
        "noDataAndroid": MessageLookupByLibrary.simpleMessage("No video found"),
        "noDataClickRetry": MessageLookupByLibrary.simpleMessage(
            "No video found, please click retry"),
        "noDataIOS": MessageLookupByLibrary.simpleMessage(
            "No video found, please check permission"),
        "noPermissionGrant": MessageLookupByLibrary.simpleMessage(
            "To grant permission, please grant manually then restart"),
        "noPermissionToast": MessageLookupByLibrary.simpleMessage(
            "Grant permissions to get video files in your phone"),
        "noRecommended": MessageLookupByLibrary.simpleMessage("No recommended"),
        "paramsVideos": m1,
        "pauseAll": MessageLookupByLibrary.simpleMessage("Pause all"),
        "playDownloadedSetting":
            MessageLookupByLibrary.simpleMessage("play downloaded first"),
        "playlist": MessageLookupByLibrary.simpleMessage("Playlist"),
        "privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
        "rateTitle": MessageLookupByLibrary.simpleMessage(
            "Please give a good review and encouragement, thank you."),
        "recommended": MessageLookupByLibrary.simpleMessage("Recommended"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "removeAllConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to remove all videos?"),
        "removeDownloadConfirmText": MessageLookupByLibrary.simpleMessage(
            "Are you sure to remove the current download"),
        "removeFromListConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to remove this video?"),
        "removePlaylistFailed":
            MessageLookupByLibrary.simpleMessage("Remove failed"),
        "removePlaylistSuccess":
            MessageLookupByLibrary.simpleMessage("Remove successful"),
        "rename": MessageLookupByLibrary.simpleMessage("Rename"),
        "replies": MessageLookupByLibrary.simpleMessage("Replies"),
        "rewardNotLoad": MessageLookupByLibrary.simpleMessage(
            "The video ad has not been loaded yet. Please try again later"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saveToGalleryFailed":
            MessageLookupByLibrary.simpleMessage("Save to gallery failed"),
        "saveToGallerySuccess": MessageLookupByLibrary.simpleMessage(
            "Save to gallery successfully"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
        "thanksRate":
            MessageLookupByLibrary.simpleMessage("Thanks for your rating."),
        "toAuthorize": MessageLookupByLibrary.simpleMessage("To authorize"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "top": MessageLookupByLibrary.simpleMessage("Top"),
        "trim": MessageLookupByLibrary.simpleMessage("Trim"),
        "userAgreement": MessageLookupByLibrary.simpleMessage("User Agreement"),
        "video": MessageLookupByLibrary.simpleMessage("Video"),
        "viewAll": MessageLookupByLibrary.simpleMessage("View All"),
        "watchLater": MessageLookupByLibrary.simpleMessage("Watch later"),
        "watchLaterCaps": MessageLookupByLibrary.simpleMessage("Watch Later")
      };
}
