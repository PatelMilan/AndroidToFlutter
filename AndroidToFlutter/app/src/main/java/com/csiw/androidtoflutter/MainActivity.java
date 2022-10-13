package com.csiw.androidtoflutter;

import android.os.Bundle;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends AppCompatActivity {
    Button btnLaunchFlutter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnLaunchFlutter = findViewById(R.id.btnLaunchFlutter);

        btnLaunchFlutter.setOnClickListener(view -> {
            startActivity(FlutterActivity.createDefaultIntent(this));
        });

    }
}