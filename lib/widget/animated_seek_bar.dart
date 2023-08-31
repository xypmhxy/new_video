/*
* 作者 Ren
* 时间  2023/7/26 21:32
*/
import 'package:flutter/material.dart';
import 'package:free_tube_player/app/app_theme_controller.dart';

import 'player_seek_bar.dart';

class AnimatedSeekBar extends StatefulWidget {
  final int duration;
  final int position;
  final double playSpeed;
  final bool isPlaying;
  final ValueChanged<int>? onSeek;

  const AnimatedSeekBar(
      {super.key,
      required this.duration,
      required this.position,
      required this.playSpeed,
      required this.isPlaying,
      this.onSeek});

  @override
  State<AnimatedSeekBar> createState() => _AnimatedSeekBarState();
}

class _AnimatedSeekBarState extends State<AnimatedSeekBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _createNew();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedSeekBar oldWidget) {
    if (oldWidget.duration != widget.duration) {
      _createNew();
      return;
    }
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying == true) {
        _animationController.forward();
      } else if (widget.isPlaying == false) {
        _animationController.stop(canceled: false);
      }
    }

    if (oldWidget.position != widget.position) {
      if (widget.isPlaying == false) {
        _animationController.value = widget.position.toDouble();
      } else {
        _animationController.forward(from: widget.position.toDouble());
      }
    }

    if (oldWidget.playSpeed != widget.playSpeed) {
      final duration = _calculateDuration();
      _animationController.duration = Duration(milliseconds: duration);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _createNew() {
    final duration = _calculateDuration();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration), upperBound: widget.duration.toDouble(), lowerBound: 0);
    _animationController.forward(from: widget.position.toDouble());
  }

  int _calculateDuration() {
    var duration = widget.duration;
    var position = widget.position;
    var remindDuration = duration - position;
    final playSpeed = widget.playSpeed;
    if (remindDuration <= 0) {
      remindDuration = 0;
    } else {
      remindDuration = remindDuration ~/ playSpeed;
    }
    return remindDuration;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return _progressBar(_animationController.value.toInt());
        });
  }

  Widget _progressBar(int progress) {
    return PlayerSeekBar(
      progress: progress,
      total: widget.duration,
      barHeight: 4,
      baseBarColor: Colors.black26,
      progressBarColor: AppThemeController.primaryThemeColor(context),
      bufferedBarColor: AppThemeController.primaryThemeColor(context).withOpacity(.3),
      thumbColor: Colors.white,
      thumbRadius: 6,
      thumbGlowRadius: 10,
      insideThumbRadius: 3,
      insideThumbColor: AppThemeController.primaryThemeColor(context),
      timeLabelLocation: TimeLabelLocation.none,
      onSeek: (value) {
        widget.onSeek?.call(value.inMilliseconds);
      },
    );
  }
}
