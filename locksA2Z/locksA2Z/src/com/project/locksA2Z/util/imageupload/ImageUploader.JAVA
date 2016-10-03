package com.project.locksA2Z.util.imageupload;

import java.io.File;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploader {

	public static String uploadImage(MultipartFile file, Map<String, String> folderPathToSize) {
		String fileName = "No image";
		try {
			Image image = null;
			InputStream inputStream = null;
			if (file.getSize() > 0) {
				inputStream = file.getInputStream();
				// for random no
				Random randomGenerator = new Random();
				int randomInt = randomGenerator.nextInt(10000);

				fileName = randomInt + "b2_" + file.getOriginalFilename();
				image = ImageLoader.fromStream(inputStream, file.getOriginalFilename());
				inputStream.close();
			}
			// resize
			for (String folderPath : folderPathToSize.keySet()) {
				Image resizedImage = resizeImage(image, folderPathToSize.get(folderPath));
				resizedImage.writeToJPG(new File(folderPath + fileName), 0.95f);
				resizedImage.dispose();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}

	private static Image resizeImage(Image image, String size) {
		return image.getResizedToWidth(Integer.parseInt(size));
	}

	public static void deleteImage(String imageFileName, Set<String> folders) {
		for (String folder : folders) {
			File imageFile = new File(folder + imageFileName);
			if (!imageFile.delete())
				System.out.println(imageFileName + " could not be deleted from " + folder);
		}
	}
}
