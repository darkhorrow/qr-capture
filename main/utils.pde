class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  boolean isLeft;
  
  Animation(String imagePrefix, int count, boolean isLeft) {
    imageCount = count;
    images = new PImage[imageCount];
    this.isLeft = isLeft;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i + 1, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    delay(35);
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeight() {
    return images[0].height;
  }
}
