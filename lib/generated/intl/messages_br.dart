// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a br locale. All the
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
  String get localeName => 'br';

  static String m0(params, params1) =>
      "baixando: ${params} - completo: ${params1}";

  static String m1(params) => "${params} vídeos";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToPlaylistFailed":
            MessageLookupByLibrary.simpleMessage("Falha na adição"),
        "addToPlaylistSuccess":
            MessageLookupByLibrary.simpleMessage("Adicionado com sucesso"),
        "addWatchLaterSuccess": MessageLookupByLibrary.simpleMessage(
            "Adicionado para assistir mais tarde"),
        "all": MessageLookupByLibrary.simpleMessage("Todos"),
        "audio": MessageLookupByLibrary.simpleMessage("Áudio"),
        "backPressedConfirm": MessageLookupByLibrary.simpleMessage(
            "Clique novamente para sair para a área de trabalho"),
        "backgroundPlayback": MessageLookupByLibrary.simpleMessage("Fundo"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "clearHistory":
            MessageLookupByLibrary.simpleMessage("Apagar o histórico"),
        "comments": MessageLookupByLibrary.simpleMessage("Comentários"),
        "confirm": MessageLookupByLibrary.simpleMessage("confirme"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja excluir este vídeo?"),
        "confirmDeleteHistory": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja excluir o histórico deste vídeo?"),
        "continueAll": MessageLookupByLibrary.simpleMessage("Continuar tudo"),
        "cover": MessageLookupByLibrary.simpleMessage("Cobrir"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Modo escuro"),
        "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Falha na exclusão"),
        "dislike": MessageLookupByLibrary.simpleMessage("Não gosto"),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "downloaded": MessageLookupByLibrary.simpleMessage("Baixado"),
        "downloading": MessageLookupByLibrary.simpleMessage("Baixando"),
        "edit": MessageLookupByLibrary.simpleMessage("Editar"),
        "exportCover":
            MessageLookupByLibrary.simpleMessage("Capa de exportação"),
        "exportVideo": MessageLookupByLibrary.simpleMessage("Exportar vídeo"),
        "file": MessageLookupByLibrary.simpleMessage("Arquivo"),
        "folder": MessageLookupByLibrary.simpleMessage("Pasta"),
        "free": MessageLookupByLibrary.simpleMessage("Livre"),
        "getPlaySourceFailed": MessageLookupByLibrary.simpleMessage(
            "Falha ao obter informações de reprodução"),
        "history": MessageLookupByLibrary.simpleMessage("História"),
        "home": MessageLookupByLibrary.simpleMessage("Lar"),
        "libDownloadCount": m0,
        "library": MessageLookupByLibrary.simpleMessage("Biblioteca"),
        "like": MessageLookupByLibrary.simpleMessage("Como"),
        "likedVideos": MessageLookupByLibrary.simpleMessage("Vídeos curtidos"),
        "live": MessageLookupByLibrary.simpleMessage("Ao vivo"),
        "loop": MessageLookupByLibrary.simpleMessage("Laço"),
        "mostLike": MessageLookupByLibrary.simpleMessage("Mais parecido"),
        "mostReplies": MessageLookupByLibrary.simpleMessage("Mais respostas"),
        "movie": MessageLookupByLibrary.simpleMessage("Filme"),
        "newPlaylist": MessageLookupByLibrary.simpleMessage("Nova Playlist"),
        "newest": MessageLookupByLibrary.simpleMessage("O mais novo"),
        "noData":
            MessageLookupByLibrary.simpleMessage("Nenhum vídeo encontrado"),
        "noDataAndroid":
            MessageLookupByLibrary.simpleMessage("Nenhum vídeo encontrado"),
        "noDataClickRetry": MessageLookupByLibrary.simpleMessage(
            "Nenhum vídeo encontrado. Clique em tentar novamente"),
        "noDataIOS": MessageLookupByLibrary.simpleMessage(
            "Nenhum vídeo encontrado, verifique a permissão"),
        "noPermissionGrant": MessageLookupByLibrary.simpleMessage(
            "Para conceder permissão, conceda manualmente e reinicie"),
        "noPermissionToast": MessageLookupByLibrary.simpleMessage(
            "Conceda permissões para obter arquivos de vídeo em seu telefone"),
        "noRecommended":
            MessageLookupByLibrary.simpleMessage("Não recomendado"),
        "paramsVideos": m1,
        "pauseAll": MessageLookupByLibrary.simpleMessage("Pausar tudo"),
        "playDownloadedSetting":
            MessageLookupByLibrary.simpleMessage("jogue baixado primeiro"),
        "playlist": MessageLookupByLibrary.simpleMessage("Lista de reprodução"),
        "privacy": MessageLookupByLibrary.simpleMessage("Privacidade"),
        "rateTitle": MessageLookupByLibrary.simpleMessage(
            "Por favor, dê uma boa avaliação e incentivo, obrigado."),
        "recommended": MessageLookupByLibrary.simpleMessage("Recomendado"),
        "remove": MessageLookupByLibrary.simpleMessage("Remover"),
        "removeAllConfirm": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja remover todos os vídeos?"),
        "removeDownloadConfirmText": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja remover o download atual"),
        "removeFromListConfirm": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja remover este vídeo?"),
        "removePlaylistFailed":
            MessageLookupByLibrary.simpleMessage("Falha na remoção"),
        "removePlaylistSuccess":
            MessageLookupByLibrary.simpleMessage("Remoção bem-sucedida"),
        "rename": MessageLookupByLibrary.simpleMessage("Renomear"),
        "replies": MessageLookupByLibrary.simpleMessage("Respostas"),
        "rewardNotLoad": MessageLookupByLibrary.simpleMessage(
            "O anúncio em vídeo ainda não foi carregado. Por favor, tente novamente mais tarde"),
        "save": MessageLookupByLibrary.simpleMessage("Salvar"),
        "saveToGalleryFailed":
            MessageLookupByLibrary.simpleMessage("Falha ao salvar na galeria"),
        "saveToGallerySuccess": MessageLookupByLibrary.simpleMessage(
            "Salvar na galeria com sucesso"),
        "search": MessageLookupByLibrary.simpleMessage("Procurar"),
        "setting": MessageLookupByLibrary.simpleMessage("Contexto"),
        "share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
        "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
        "thanksRate": MessageLookupByLibrary.simpleMessage(
            "Obrigado pela sua avaliação."),
        "toAuthorize": MessageLookupByLibrary.simpleMessage("Para autorizar"),
        "today": MessageLookupByLibrary.simpleMessage("Hoje"),
        "top": MessageLookupByLibrary.simpleMessage("Principal"),
        "trim": MessageLookupByLibrary.simpleMessage("Aparar"),
        "userAgreement":
            MessageLookupByLibrary.simpleMessage("Termo de Acordo do Usuário"),
        "video": MessageLookupByLibrary.simpleMessage("Vídeo"),
        "viewAll": MessageLookupByLibrary.simpleMessage("Ver tudo"),
        "watchLater": MessageLookupByLibrary.simpleMessage("Assistir depois"),
        "watchLaterCaps":
            MessageLookupByLibrary.simpleMessage("Assistir depois")
      };
}
