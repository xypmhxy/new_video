package com.example.new_video

import android.os.Bundle
import com.example.new_video.tube.logger.LoggerChannel
import com.nl.free.tube.channel.DefaultMethodChannel
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private lateinit var mLoggerChannel: LoggerChannel
    private lateinit var mDefaultChannel: DefaultMethodChannel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (flutterEngine != null) {
            mLoggerChannel = LoggerChannel(flutterEngine!!.dartExecutor.binaryMessenger)
            mDefaultChannel = DefaultMethodChannel(flutterEngine!!.dartExecutor.binaryMessenger)
        }
    }
}
