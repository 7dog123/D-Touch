package com.beloko.doom;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.widget.Button;
import android.widget.TextView;

import com.beloko.idtech.AppSettings;
import com.beloko.doom.R;

public class IntroDialog {

	public static void show(final Context ctx)
	{
		final Dialog dialog = new Dialog(ctx);
		dialog.setContentView(R.layout.intro);
		dialog.setTitle("Doom Touch");
		dialog.setCancelable(true);
		//there are a lot of settings, for dialog, check them all out!

		//set up text
		final TextView text = (TextView) dialog.findViewById(R.id.textView1);
		text.setText(readTxt(ctx,R.raw.intro));

		//set up image view


		//set up button
		Button button = (Button) dialog.findViewById(R.id.button1);
		button.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				dialog.dismiss();    
			}
		});


	
		//now that the dialog is set up, it's time to show it    
		dialog.show();

	}


	private static String readTxt(Context ctx, int id){

		InputStream inputStream = ctx.getResources().openRawResource(id);

		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

		int i;
		try {
			i = inputStream.read();
			while (i != -1)
			{
				byteArrayOutputStream.write(i);
				i = inputStream.read();
			}
			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return byteArrayOutputStream.toString();
	}

	public static boolean showIntro(Context ctx)
	{
		int show = AppSettings.getIntOption(ctx,"intro_shown", -1);
		if (show == -1)
		{
			AppSettings.setIntOption(ctx, "intro_shown", 1);
			return true;
		}
		else
			return false;
	}
}
