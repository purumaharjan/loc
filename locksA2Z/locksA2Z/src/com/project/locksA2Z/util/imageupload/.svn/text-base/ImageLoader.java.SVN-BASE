package com.project.locksA2Z.util.imageupload;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class ImageLoader {
	
	private ImageLoader() {
	}

	public static Image fromUrl(URL url) throws IOException {
		return new Image(url.openStream(), extensionToImageType(url.getPath()));
	}

	public static Image fromUrl(String url) throws IOException {
		return fromUrl(new URL(url));
	}

	public static Image fromFile(File file) throws IOException {
		return new Image(new FileInputStream(file), extensionToImageType(file.getPath()));
	}

	public static Image fromFile(String file) throws IOException {
		return fromFile(new File(file));
	}

	public static Image fromBytes(byte[] data) throws IOException {
		return fromBytes(data, ImageType.unknown);
	}

	public static Image fromBytes(byte[] data, ImageType sourceType) throws IOException {
		return new Image(new ByteArrayInputStream(data), sourceType);
	}

	public static Image fromStream(InputStream in,String filePath) throws IOException {
		return fromStream(in, extensionToImageType(filePath));
	}

	public static Image fromStream(InputStream in, ImageType sourceType) throws IOException {
		return new Image(in, sourceType);
	}

	private static ImageType extensionToImageType(String path) {
		int idx = (path == null ? -1 : path.lastIndexOf("."));
		if (idx != -1)
			return ImageType.getType(path.substring(idx + 1));
		else
			return ImageType.unknown;
	}
}
