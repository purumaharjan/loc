package com.project.locksA2Z.util.imageupload;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

import javax.imageio.ImageIO;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.MultiStepRescaleOp;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class Image {
	BufferedImage img;
	ImageType sourceType = ImageType.unknown;

	Image(InputStream input, ImageType sourceType) throws IOException {
		img = ImageIO.read(input);
		input.close();
		this.sourceType = (sourceType == null ? ImageType.unknown : sourceType);
	}

	private Image(BufferedImage img, ImageType sourceType) {
		this.img = img;
		this.sourceType = (sourceType == null ? ImageType.unknown : sourceType);
	}

	public ImageType getSourceType() {
		return sourceType;
	}

	public int getWidth() {
		return img.getWidth();
	}

	public int getHeight() {
		return img.getHeight();
	}

	public double getAspectRatio() {
		return (double) getWidth() / (double) getHeight();
	}

	public Image getResizedToWidth(int width) {
		if (width > getWidth())
			throw new IllegalArgumentException("Width " + width + " exceeds width of image, which is " + getWidth());
		int nHeight = width * img.getHeight() / img.getWidth();
		MultiStepRescaleOp rescale = new MultiStepRescaleOp(width, nHeight);
		rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
		BufferedImage resizedImage = rescale.filter(img, null);

		return new Image(resizedImage, sourceType);
	}

	public Image crop(int x1, int y1, int x2, int y2) {
		if (x1 < 0 || x2 <= x1 || y1 < 0 || y2 <= y1 || x2 > getWidth() || y2 > getHeight())
			throw new IllegalArgumentException("invalid crop coordinates");

		int type = img.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : img.getType();
		int nNewWidth = x2 - x1;
		int nNewHeight = y2 - y1;
		BufferedImage cropped = new BufferedImage(nNewWidth, nNewHeight, type);
		Graphics2D g = cropped.createGraphics();

		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.setComposite(AlphaComposite.Src);

		g.drawImage(img, 0, 0, nNewWidth, nNewHeight, x1, y1, x2, y2, null);
		g.dispose();

		return new Image(cropped, sourceType);
	}

	public Image getResizedToSquare(int width, double cropEdgesPct) {
		if (cropEdgesPct < 0 || cropEdgesPct > 0.5)
			throw new IllegalArgumentException("Crop edges pct must be between 0 and 0.5. " + cropEdgesPct + " was supplied.");
		if (width > getWidth())
			throw new IllegalArgumentException("Width " + width + " exceeds width of image, which is " + getWidth());
		// crop to square first. determine the coordinates.
		int cropMargin = (int) Math.abs(Math.round(((img.getWidth() - img.getHeight()) / 2.0)));
		int x1 = 0;
		int y1 = 0;
		int x2 = getWidth();
		int y2 = getHeight();
		if (getWidth() > getHeight()) {
			x1 = cropMargin;
			x2 = x1 + y2;
		} else {
			y1 = cropMargin;
			y2 = y1 + x2;
		}

		// should there be any edge cropping?
		if (cropEdgesPct != 0) {
			int cropEdgeAmt = (int) ((double) (x2 - x1) * cropEdgesPct);
			x1 += cropEdgeAmt;
			x2 -= cropEdgeAmt;
			y1 += cropEdgeAmt;
			y2 -= cropEdgeAmt;
		}

		// generate the image cropped to a square
		Image cropped = crop(x1, y1, x2, y2);

		// now resize. we do crop first then resize to preserve detail
		Image resized = cropped.getResizedToWidth(width);
		cropped.dispose();

		return resized;
	}

	public Image soften(float softenFactor) {
		if (softenFactor == 0f)
			return this;
		else {
			float[] softenArray = { 0, softenFactor, 0, softenFactor, 1 - (softenFactor * 4), softenFactor, 0, softenFactor, 0 };
			Kernel kernel = new Kernel(3, 3, softenArray);
			ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
			return new Image(cOp.filter(img, null), sourceType);
		}
	}

	public File writeToFile(File file) throws IOException {
		if (file == null)
			throw new IllegalArgumentException("File argument was null");

		File writeto = null;

		// extract extension
		String name = file.getName();
		String ext = null;
		int dot = name.lastIndexOf(".");
		if (dot != -1)
			ext = name.substring(dot + 1).toLowerCase();

		// the presence of an extension in the file name tells us to
		// attempt to write the image of that type, if it is supported
		if (ext != null) {
			if (Arrays.asList(getWriterFormatNames()).contains(ext))
				writeto = file;
			else {
				// failing that, default to jpg
				ext = "jpg";
				writeto = new File(file.getPath() + ".jpg");
			}
		} else {
			// if no extension is supplied, try to use the image type of the
			// source image
			if (Arrays.asList(getWriterFormatNames()).contains(getSourceType().toString().toLowerCase())) {
				ext = getSourceType().toString().toLowerCase();
				writeto = new File(file.getPath() + "." + getSourceType().toString().toLowerCase());
			} else {
				// failing that, default to jpg
				ext = "jpg";
				writeto = new File(file.getPath() + ".jpg");
			}
		}
		writeToFile(writeto, ext);
		return writeto;
	}

	public void writeToFile(File file, String type) throws IOException {
		if (file == null)
			throw new IllegalArgumentException("File argument was null");
		ImageIO.write(img, type, file);
	}

	public String[] getWriterFormatNames() {
		return ImageIO.getWriterFormatNames();
	}

	public void writeToJPG(File file, float quality) throws IOException {
		FileOutputStream out = new FileOutputStream(file);

		// Encodes image as a JPEG data stream
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);

		JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(img);

		param.setQuality(quality, true);

		encoder.setJPEGEncodeParam(param);
		encoder.encode(img);
	}

	public void dispose() {
		img.flush();
	}

}
