package com.framework.innodale.component;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.IOException;

public class ImageUtil {

    /**
     * 이미지를 리사이즈 한다.
     * 소스 이미지 파일의 width, height 중 크기가 큰 쪽을 기준으로 하여 비율을 유지한채 이미지를 생성한다.
     * @param srcPath 소스 이미지 경로
     * @param destPath 대상 이미지 경로
     * @param width 리사이즈할 가로 사이즈
     * @param height 리사이즈할 세로 사이즈
     */
    public static void resize(String srcPath, String destPath, int width, int height) {
        File srcFile = new File(srcPath);
        File destFile = new File(destPath);
        resize(srcFile, destFile, width, height);
    }

    /**
     * 이미지를 리사이즈 한다.(png 저장)
     * 소스 이미지 파일의 width, height 중 크기가 큰 쪽을 기준으로 하여 비율을 유지한채 이미지를 생성한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     * @param width 리사이즈할 가로 사이즈
     * @param height 리사이즈할 세로 사이즈
     */
    public static void resize(File srcFile, File destFile, int width, int height) {
        Image resizedImg = null;
        BufferedImage bufImg = null;
        try {
            BufferedImage image = ImageIO.read(srcFile);
            double scale = getScale(width, height, image.getWidth(), image.getHeight());
            int scaleWidth = (int) (scale * image.getWidth());
            int scaleHeight = (int) (scale * image.getHeight());
            resizedImg = image.getScaledInstance(scaleWidth, scaleHeight, Image.SCALE_SMOOTH);
            bufImg = new BufferedImage(resizedImg.getWidth(null), resizedImg.getHeight(null), image.getType());
            Graphics2D g2d = bufImg.createGraphics();
            g2d.drawImage(resizedImg, 0, 0, null);
            g2d.dispose();
            ImageIO.write(bufImg, "jpg", destFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (resizedImg != null) {
                resizedImg.flush();
            }
            if (bufImg != null) {
                bufImg.flush();
            }
        }
    }

/**
     * 이미지를 리사이즈 한다.(png 저장)
     * 소스 이미지 파일의 width, height 지정 사이즈로 이미지를 생성한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     * @param width 리사이즈할 가로 사이즈
     * @param height 리사이즈할 세로 사이즈
     */
    public static void resizeFix(File src, File dest, int destWidth, int destHeight) throws IOException {
        Image srcImg = null;
        String suffix = src.getName().substring(src.getName().lastIndexOf('.')+1).toLowerCase();
        if (suffix.equals("bmp") || suffix.equals("png") || suffix.equals("gif")) {
            srcImg = ImageIO.read(src);
        } else {
            // BMP가 아닌 경우 ImageIcon을 활용해서 Image 생성
            // 이렇게 하는 이유는 getScaledInstance를 통해 구한 이미지를
            // PixelGrabber.grabPixels로 리사이즈 할때
            // 빠르게 처리하기 위함이다.
            srcImg = new ImageIcon(src.toURL()).getImage();
        }

        Image imgTarget = srcImg.getScaledInstance(destWidth, destHeight, Image.SCALE_SMOOTH);
        int pixels[] = new int[destWidth * destHeight];
        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth, destHeight, pixels, 0, destWidth);
        try {
            pg.grabPixels();
        } catch (InterruptedException e) {
            throw new IOException(e.getMessage());
        }
        BufferedImage destImg = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
        destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);

        ImageIO.write(destImg, "jpg", dest);
    }

    /**
     * 이미지를 리사이즈 한다.(png 저장)
     * 소스 이미지 파일의 width를 기준으로 하여 비율을 유지한채 이미지를 생성한다.
     * @param srcPath 소스 이미지 경로
     * @param destPath 대상 이미지 경로
     * @param width 리사이즈할 가로 사이즈
     */
    public static void resizeWidth(String srcPath, String destPath, int width) {
        File srcFile = new File(srcPath);
        File destFile = new File(destPath);
        resizeWidth(srcFile, destFile, width);
    }

    /**
     * 이미지를 리사이즈 한다.(png 저장)
     * 소스 이미지 파일의 width를 기준으로 하여 비율을 유지한채 이미지를 생성한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     * @param width 리사이즈할 가로 사이즈
     */
    public static void resizeWidth(File srcFile, File destFile, int width) {
        Image resizedImg = null;
        BufferedImage bufImg = null;
        try {
            BufferedImage image = ImageIO.read(srcFile);
            double scale = getScale(width, image.getWidth());
            int scaleWidth = (int) (scale * image.getWidth());
            int scaleHeight = (int) (scale * image.getHeight());
            resizedImg = image.getScaledInstance(scaleWidth, scaleHeight, Image.SCALE_SMOOTH);
            bufImg = new BufferedImage(resizedImg.getWidth(null), resizedImg.getHeight(null), image.getType());
            Graphics2D g2d = bufImg.createGraphics();
            g2d.drawImage(resizedImg, 0, 0, null);
            g2d.dispose();
            ImageIO.write(bufImg, "png", destFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (resizedImg != null) {
                resizedImg.flush();
            }
            if (bufImg != null) {
                bufImg.flush();
            }
        }
    }

    /**
     * 이미지를 리사이즈 한다.(png 저장)
     * 소스 이미지 파일의 height를 기준으로 하여 비율을 유지한채 이미지를 생성한다.
     * @param srcPath 소스 이미지 경로
     * @param destPath 대상 이미지 경로
     * @param height 리사이즈할 세로 사이즈
     */
    public static void resizeHeight(String srcPath, String destPath, int height) {
        File srcFile = new File(srcPath);
        File destFile = new File(destPath);
        resizeHeight(srcFile, destFile, height);
    }

    /**
     * 이미지를 리사이즈 한다.(jpg로 저장)
     * 소스 이미지 파일의 height를 기준으로 하여 비율을 유지한채 이미지를 생성한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     * @param height 리사이즈할 세로 사이즈
     */
    public static void resizeHeight(File srcFile, File destFile, int height) {
        Image resizedImg = null;
        BufferedImage bufImg = null;
        try {
            BufferedImage image = ImageIO.read(srcFile);
            double scale = getScale(height, image.getHeight());
            int scaleWidth = (int) (scale * image.getWidth());
            int scaleHeight = (int) (scale * image.getHeight());
            resizedImg = image.getScaledInstance(scaleWidth, scaleHeight, Image.SCALE_SMOOTH);
            bufImg = new BufferedImage(resizedImg.getWidth(null), resizedImg.getHeight(null), image.getType());
            Graphics2D g2d = bufImg.createGraphics();
            g2d.drawImage(resizedImg, 0, 0, null);
            g2d.dispose();
            ImageIO.write(bufImg, "jpg", destFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (resizedImg != null) {
                resizedImg.flush();
            }
            if (bufImg != null) {
                bufImg.flush();
            }
        }
    }

    /**
     * 이미지를 오른쪽으로 90도 회전한다.(jpg로 저장)
     * 소스 이미지 파일의 크기는 유지한채 이미지를 오른쪽으로 90도 회전한다.
     * @param srcPath 소스 이미지 경로
     * @param destPath 대상 이미지 경로
     */
    public static void rotate90(String srcPath, String destPath) {
        File srcFile = new File(srcPath);
        File destFile = new File(destPath);
        rotate90(srcFile, destFile);
    }

    /**
     * 이미지를 오른쪽으로 90도 회전한다.(jpg로 저장)
     * 소스 이미지 파일의 크기는 유지한채 이미지를 오른쪽으로 90도 회전한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     */
    public static void rotate90(File srcFile, File destFile) {
        rotate(srcFile, destFile, 90);
    }

    /**
     * 이미지를 180도 회전한다.(jpg로 저장)
     * 소스 이미지 파일의 크기는 유지한채 이미지를 180도 회전한다.
     * @param srcPath 소스 이미지 경로
     * @param destPath 대상 이미지 경로
     */
    public static void rotate180(String srcPath, String destPath) {
        File srcFile = new File(srcPath);
        File destFile = new File(destPath);
        rotate180(srcFile, destFile);
    }

    /**
     * 이미지를 180도 회전한다.(jpg로 저장)
     * 소스 이미지 파일의 크기는 유지한채 이미지를 180도 회전한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     */
    public static void rotate180(File srcFile, File destFile) {
        rotate(srcFile, destFile, 180);
    }

    /**
     * 이미지를 270도(왼쪽으로 90도) 회전한다.(jpg로 저장)
     * 소스 이미지 파일의 크기는 유지한채 이미지를 270도(왼쪽으로 90도) 회전한다.
     * @param srcPath 소스 이미지 경로
     * @param destPath 대상 이미지 경로
     */
    public static void rotate270(String srcPath, String destPath) {
        File srcFile = new File(srcPath);
        File destFile = new File(destPath);
        rotate270(srcFile, destFile);
    }

    /**
     * 이미지를 270도(왼쪽으로 90도) 회전한다.(jpg로 저장)
     * 소스 이미지 파일의 크기는 유지한채 이미지를 270도(왼쪽으로 90도) 회전한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     */
    public static void rotate270(File srcFile, File destFile) {
        rotate(srcFile, destFile, 270);
    }


    /**
     * 이미지를 회전한다.
     * 소스 이미지 파일의 크기는 유지한채 이미지를 회전한다.
     * @param srcFile 소스 이미지 파일
     * @param destFile 대상 이미지 파일
     * @param rotation 각도(90, 180, 270)
     */
    private static void rotate(File srcFile, File destFile, int rotation) {
        BufferedImage rotatedImg = null;
        try {
            BufferedImage image = ImageIO.read(srcFile);
            double x = 0, y = 0;
            if (rotation % 360 == 90) {
                x = image.getHeight();
                rotatedImg = new BufferedImage(image.getHeight(), image.getWidth(), image.getType());
            } else if (rotation % 360 == 270) {
                y = image.getWidth();
                rotatedImg = new BufferedImage(image.getHeight(), image.getWidth(), image.getType());
            } else if (rotation % 360 == 180) {
                x = image.getWidth();
                y = image.getHeight();
                rotatedImg = new BufferedImage(image.getWidth(), image.getHeight(), image.getType());
            } else {
                rotatedImg = new BufferedImage(image.getWidth(), image.getHeight(), image.getType());
            }
            Graphics2D g2d = rotatedImg.createGraphics();
            g2d.translate(x, y);
            g2d.rotate(Math.toRadians(rotation));
            g2d.drawImage(image, 0, 0, null);
            g2d.dispose();
            ImageIO.write(rotatedImg, "png", destFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (rotatedImg != null) {
                rotatedImg.flush();
            }
        }
    }

    /**
     * 원본 이미지 사이즈와 리사이즈할 사이즈로 이미지 스케일 비율을 구한다.
     * 크기가 큰 폭을 기준으로 동일 비율로 한다.
     * @param resizeWidth 리사이즈할 가로 사이즈
     * @param resizeHeight 리사이즈할 세로 사이즈
     * @param imageWidth 원본 이미지의 가로 사이즈
     * @param imageHeight 원본 이미지의 세로 사이즈
     * @return 스케일 비율
     */
    private static double getScale(int resizeWidth, int resizeHeight, int imageWidth, int imageHeight) {
        double widthScale = (double) resizeWidth / imageWidth;
        double heightScale = (double) resizeHeight / (double) imageHeight;
        if (widthScale > heightScale) {
            return heightScale;
        } else {
            return widthScale;
        }
    }

    /**
     * 원본 이미지 사이즈와 리사이즈할 사이즈로 이미지 스케일 비율을 구한다.
     * 크기가 큰 쪽을 기준으로 동일 비율로 한다.
     * @param size 리사이즈할  사이즈
     * @param imageSize 원본 이미지의  사이즈
     * @return 스케일 비율
     */
    private static double getScale(int size, int imageSize) {
        double scale = (double) size / imageSize;
        return scale;
    }
}
