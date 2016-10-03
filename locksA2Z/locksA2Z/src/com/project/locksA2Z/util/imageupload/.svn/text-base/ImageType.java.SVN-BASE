package com.project.locksA2Z.util.imageupload;

import java.util.HashMap;
import java.util.Map;

public enum ImageType {
	jpg, gif, png, unknown;

	private static final Map<String, ImageType> extensionMap = new HashMap<String, ImageType>();

	static {
		extensionMap.put("png", ImageType.png);
		extensionMap.put("jpg", ImageType.jpg);
		extensionMap.put("jpeg", ImageType.jpg);
		extensionMap.put("gif", ImageType.gif);
	}

	public static ImageType getType(String ext) {
		ext = ext.toLowerCase();
		if (extensionMap.containsKey(ext)) {
			return extensionMap.get(ext);
		} else
			return unknown;
	}

}
