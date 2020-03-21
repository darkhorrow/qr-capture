import processing.video.*;
import qrcodeprocessing.*;
import java.util.ArrayList;

ArrayList<PShape> shapes = new ArrayList<PShape>();

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
  PShape shape = loadShape(code);
  if(shape != null) {
    if(!shapes.contains(shape)) shapes.add(shape);
  }
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);
  image(video, 0, 0);
  
  if(shapes.size() > 0) shape(shapes.get(0));

  if (decoder.decoding()) {
    
  } else {
    PImage savedFrame = createImage(video.width, video.height, RGB);
    savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    savedFrame.updatePixels();

    decoder.decodeImage(savedFrame);
  }
}
