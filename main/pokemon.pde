class Pokemon {

  String name;
  PImage sprite;
  float hp;
  float attack;
  float defense;
  float sp_attack;
  float sp_defense;
  float speed;
  int frames;

  public Pokemon(String name, PImage sprite, float hp, float attack, float defense, float sp_attack, float sp_defense, float speed, int frames) {
    this.name = name;
    this.sprite = sprite;
    this.hp = hp;
    this.attack = attack;
    this.defense = defense;
    this.sp_attack = sp_attack;
    this.sp_defense = sp_defense;
    this.speed = speed;
    this.frames = frames;
  }

  @Override
    boolean equals(Object p) {
    if (p == this) { 
      return true;
    } 
    
    if (!(p instanceof Pokemon)) { 
      return false;
    } 

    Pokemon pk = (Pokemon) p; 

    return pk.name.equals(this.name);
  }
}
