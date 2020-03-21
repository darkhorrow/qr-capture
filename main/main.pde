import processing.video.*;
import qrcodeprocessing.*;
import java.util.ArrayList;

ArrayList<Pokemon> pokemons = new ArrayList<Pokemon>();

Capture video;

Decoder decoder;

boolean isInCharacterSelection = true;

String feedbackMessage = "Waiting PLAYER 1 to scan a Pokemon QR...";

Animation animation1;
Animation animation2;

void setup() {
  size(640, 480, P3D);
  video = new Capture(this, width, height);
  video.start();

  decoder = new Decoder(this);
}

void decoderEvent(Decoder decoder) {
  String code = decoder.getDecodedString();
  Pokemon pk = null;
  switch(code) {
  case "charmander":
    pk = new Pokemon(code, loadImage(code + ".gif"), 39, 52, 43, 60, 50, 65, 14);
    break;
  case "squirtle":
    pk = new Pokemon(code, loadImage(code + ".gif"), 44, 48, 65, 50, 64, 43, 12);
    break;
  case "bulbasaur":
    pk = new Pokemon(code, loadImage(code + ".gif"), 45, 49, 49, 65, 65, 45, 52);
    break;
  default:
    break;
  }

  if (pk != null && !pokemons.contains(pk)) pokemons.add(pk);
  if (pokemons.size() == 1) {
    feedbackMessage = "Waiting PLAYER 2 to scan a Pokemon QR...";
  }
  if (pokemons.size() == 2) {
    feedbackMessage = "";
    animation1 = new Animation(pokemons.get(0).name, pokemons.get(0).frames, true);
    animation2 = new Animation(pokemons.get(1).name, pokemons.get(1).frames, false);
    isInCharacterSelection = false;
  }
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);
  image(video, 0, 0);

  textSize(20);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text(feedbackMessage, width/2, height - 20);
  fill(255);

  if (isInCharacterSelection) {
    if (decoder.decoding()) {
    } else {
      PImage savedFrame = createImage(video.width, video.height, RGB);
      savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
      savedFrame.updatePixels();
      
      decoder.decodeImage(savedFrame);
    }
  } else {
    animation2.display(width - animation2.getWidth(), 0);
    scale(-1.0, 1.0);
    animation1.display(-animation1.getWidth(), height - animation1.getHeight());
  }
}
