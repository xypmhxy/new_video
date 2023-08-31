/*
* 作者 Ren
* 时间  2023/7/25 21:14
*/

abstract class PlayerPageCallback {
    void onClickBack();
    void onTogglePanel();
    void onDoubleTap();
    void onLongPressed(bool isEnd);
    void onMoveStart(double dx);
    void onMove(double dx);
    void onMoveEnd();
    void onClickBack10Second();
    void onClickPlay();
    void onClickForward10Second();
    void onSeek(int value);
    void onShowMoreDialog();
}