import processing.video.*;
import qrcodeprocessing.*;

Capture video;

Decoder decoder;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();

  decoder = new Decoder(this);
}

void decoderEvent(Decoder decoder) {
  String code = decoder.getDecodedString();
  println(code);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);
  image(video, 0, 0);

  if (decoder.decoding()) {
    
  } else {
    PImage savedFrame = createImage(video.width, video.height, RGB);
    savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    savedFrame.updatePixels();

    decoder.decodeImage(savedFrame);
  }
}
