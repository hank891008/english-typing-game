String st[][] = {
{"backstage", "backstairs", "backstay", "backstitch", "backstop", "backstory", "backwind", "backwoods", "backwoodsman", "backword", "backwrap", "backyard", "baclava", "baclofen", "caballero", "cabana", "cabanatuan", "cabane", "cabaret", "caboched", "cabochon", "caboclo", "caboodle", "caboose", "deter", "deterge", "glinn", "glint", "glinty", "algebra", "length", "insert", "apple", "banana", "break", "continue", "define", "cat", "dog", "elephant", "graf", "house", "sample", "cream", "juice", "kite", "lenth", "monkey", "orange", "algebra"},
{"baas", "baalism", "babbitt", "babbittry", "babylonian", "backfall", "backfield", "backfile", "backfill", "backfire", "backfist", "backfit", "backflash", "backflip", "cabbagy", "cabbala", "cabbie", "cabble", "cabby", "cabdriver", "cabinetwood", "cabinetwork", "detrition", "detritivore", "detritovore", "detritus", "euploid", "eupnea", "eupnoea", "eupraxia", "eurafrican", "eurailpass", "euramerican", "ridgeline", "ridgeling", "ridgepole", "ridge", "rib", "ridgetree", "ridgeway", "parables", "parabola", "parabolic", "gliomatosis", "glioneuroma", "gliosarcoma", "oropharynx", "algebradfd", "orosomucoid", "oscular"},
{"abdominocentesis", "abdominocyesis", "abdominocystic", "abdominogenital", "abdominohysterectomy", "abdominohysterotomy", "abdominoperineal", "abdominoplasty", "abdominoscopy", "abdominoscrotal", "abdominothoracic", "abdominothoracic", "arch", "abdominous", "abdominovaginal", "abdominovesical", "acrobrachycephaly", "bacchanalian", "bacchylides", "bacteriochlorophyll", "bacteriolysin", "bacteriolysis", "bacteriopexy", "bacteriophage", "bacteriopsonin", "bacteriorhodopsin", "bacterioscopy", "caducibranchiate", "Caernarvonshire", "cainogenesis", "cainotophobia", "algebra", "calabaza", "calabazilla", "calabogus", "calaboose", "calabrasella", "deuterocanonical", "deuteropathy", "deuteroplasm", "deuterostome", "deuterotoky", "devascularization", "zygophyllaceous", "oropharyngolaryngitis", "zygopteran", "papulosquamous", "papulovesicular", "zygosporangium", "papuloerythematous"}
};
PImage right, wrong, bg;
PImage menu, replay, leave, home;
PImage easy, normal, professional;
int pos;
int index;
int point;
int begin_time;
int state;
int difficulty;
int flag;
boolean click;
PFont font;
PFont zigBlack;

void setup(){
  //font = createFont("SourceHanSansCN-Medium",30);
  zigBlack = createFont("GenEiMGothic2-Bold.ttf", 32);
  right = loadImage("right.png");  
  wrong = loadImage("wrong.png");
  
  menu = loadImage("menu.png");
  replay = loadImage("replay.png");
  leave = loadImage("leave.png");
  home = loadImage("home.png");
  
  easy = loadImage("easy.jpg");
  normal = loadImage("normal.jpg");
  professional = loadImage("difficult.jpg");
  
  
  bg = loadImage("background.jpg");
  size(800, 600);
  strokeWeight(4);
  smooth();
  index = int(random(0, 50));
  frameRate(25);
  state = 0;
  flag = 0;
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 50; j++){
      int rand = int(random(0, 50));
      String tmp = st[i][j];
      st[i][j] = st[i][rand];
      st[i][rand] = tmp;
    }
  }
}
void keyReleased(){
  if(key >= 'a' && key <= 'z' && state == 3 && (millis() / 1000 - begin_time) > 5){
    if(pos <  st[difficulty][index].length() && key == st[difficulty][index].charAt(pos)){
      pos += 1;
    }
    else{
      pos = 0;
      index = int(random(0, 50));
      image(wrong, 400 + 20- sqrt(200 * 200 * 2)  / 2, 300 - sqrt(200 * 200 * 2) / 2 , 200, 200);
    }
    if(pos == st[difficulty][index].length()){
      pos = 0;
      point += 1;
      index = int(random(0, 50));
      image(right, 400 + 20 - sqrt(200 * 200 * 2) / 2, 300 - sqrt(200 * 200 * 2) / 2, 200, 200);
    }
  }
}
void mouseClicked(){
  click = true;
}
void draw()
{
  //textFont(font, 100);
  if(state == 0)  //init_page
  {
    background(bg);
    fill(255);
    textAlign(CENTER);
    textSize(60);
    text("English Spelling Master", 400, 150);
    rect(130, 350, 200, 100);
    rect(430, 350, 200, 100);
    fill(100);
    textAlign(CENTER);
    textSize(30);  
    text("Start", 230, 410);
    text("Manual", 530, 410);
    if (click == true && mouseButton == LEFT && mouseX > 130 && mouseX < 330 && mouseY > 350 && mouseY < 450)
    {
      click = false;
      state = 1;
      flag = 0;
    }
    if(click == true && mouseButton == LEFT && mouseX > 430 && mouseX < 630 && mouseY > 350 && mouseY < 450)
    {
      click = false;
      state = 2;
      flag = 0;
    }
    
    image(menu, 700, 500, 80, 80);
    if (click == true && mouseButton == LEFT && mouseX > 700 && mouseX < 780 && mouseY > 500 && mouseY < 580){
      click = false;
      flag++;
      if (flag > 1)
        flag = 0;
    }
    if (flag == 1)
    {
      image(replay, 710, 420, 80, 80);
        if (click == true && mouseButton == LEFT && mouseX > 710 && mouseX < 770 && mouseY > 420 && mouseY < 500){
          click = false;
          state = 1;
          flag = 0;
        }
    
      image(home, 660, 450, 50, 50);
        if (click == true && mouseButton == LEFT && mouseX > 660 && mouseX < 710 && mouseY > 450 && mouseY < 500){
          click = false;
          state = 0;
          flag = 0;
        }
        
      image(leave, 620, 510, 60, 60);
        if (click == true && mouseButton == LEFT && mouseX > 620 && mouseX < 680 && mouseY > 510 && mouseY < 570){
          click = false;
          exit();
        }
    }
  }
  else if(state == 1)  //game menu
  {
    begin_time = millis() / 1000;
    point = 0;
    pos = 0;
    background(bg);
       
    image(easy, 250, 70, 270, 125);
    image(normal, 250, 220, 270, 125);
    image(professional, 250, 370, 270, 125);
    
    if (click == true && mouseButton == LEFT && mouseX > 250 && mouseX < 520 && mouseY > 100 && mouseY < 195)
    {
      click = false;
      state = 3;
      flag = 0;
      difficulty = 0;
    }
    if(click == true && mouseButton == LEFT && mouseX > 250 && mouseX < 520 && mouseY > 250 && mouseY < 345)
    {
      click = false;
      state = 3;
      flag = 0;
      difficulty = 1;
    }
    if(click == true && mouseButton == LEFT && mouseX > 250 && mouseX < 520 && mouseY > 400 && mouseY < 495)
    {
      click = false;
      state = 3;
      flag = 0;
      difficulty = 2;
    }
    
    image(menu, 700, 500, 80, 80);
    if (click == true && mouseButton == LEFT && mouseX > 700 && mouseX < 780 && mouseY > 500 && mouseY < 580){
      click = false;
      flag++;
      if (flag > 1)
        flag = 0;
    }
    if (flag == 1)
    {
      image(replay, 710, 420, 80, 80);
        if (click == true && mouseButton == LEFT && mouseX > 710 && mouseX < 770 && mouseY > 420 && mouseY < 500){
          click = false;
          state = 1;
          flag = 0;
        }
    
      image(home, 660, 450, 50, 50);
        if (click == true && mouseButton == LEFT && mouseX > 660 && mouseX < 710 && mouseY > 450 && mouseY < 500){
          click = false;
          state = 0;
          flag = 0;
        }
        
      image(leave, 620, 510, 60, 60);
        if (click == true && mouseButton == LEFT && mouseX > 620 && mouseX < 680 && mouseY > 510 && mouseY < 570){
          click = false;
          exit();
        }
    }
  }
  else if(state == 2)  //descript
  {
    background(bg);
    textFont(zigBlack, 100);
    fill(241, 224, 255);
    textAlign(CENTER);
    textSize(65);
    text("遊戲說明", 400, 150);
    textSize(40);
    text("限定時間內，輸入螢幕上所", 400, 250);
    text("顯示的單字，輸入正確則獲", 400, 300);
    text("得一分，輸入過程錯誤則跳", 400, 350);
    text("下一個單字。", 400, 400);
    
    image(menu, 700, 500, 80, 80);
    if (click == true && mouseButton == LEFT && mouseX > 700 && mouseX < 780 && mouseY > 500 && mouseY < 580){
      click = false;
      flag++;
      if (flag > 1)
        flag = 0;
    }
    if (flag == 1)
    {
      image(replay, 710, 420, 80, 80);
        if (click == true && mouseButton == LEFT && mouseX > 710 && mouseX < 770 && mouseY > 420 && mouseY < 500){
          click = false;
          state = 1;
          flag = 0;
        }
    
      image(home, 660, 450, 50, 50);
        if (click == true && mouseButton == LEFT && mouseX > 660 && mouseX < 710 && mouseY > 450 && mouseY < 500){
          click = false;
          state = 0;
          flag = 0;
        }
        
      image(leave, 620, 510, 60, 60);
        if (click == true && mouseButton == LEFT && mouseX > 620 && mouseX < 680 && mouseY > 510 && mouseY < 570){
          click = false;
          exit();
        }
    }
  }
  else if (state == 3)  //game
  {
    background(bg);
    if((millis() / 1000 - begin_time) <= 5){
      textSize(100);
      fill(255);
      textAlign(CENTER);
      text(6 - (millis() / 1000 - begin_time), 400, 300);
      return;
    }
    textAlign(LEFT);
    textSize(50);
    fill(255);
    text("points: " + point, 50, 50);
    fill(255);
    text("Time: " + (45 - ((millis() / 1000 - begin_time) - 6)), 500, 50);
    if((millis() / 1000 - begin_time) - 6 == 45){
      state = 4;
    }
    textSize(50);
    float s = textWidth(st[difficulty][index].substring(0, pos));
    fill(255, 0, 0);
    text(st[difficulty][index].substring(0, pos), 400 - textWidth(st[difficulty][index]) / 2, 300);
    fill(255);
    text(st[difficulty][index].substring(pos), 400 - textWidth(st[difficulty][index]) / 2 + s, 300);
    
    image(menu, 700, 500, 80, 80);
    if (click == true && mouseButton == LEFT && mouseX > 700 && mouseX < 780 && mouseY > 500 && mouseY < 580){
      click = false;
      flag++;
      if (flag > 1)
        flag = 0;
    }
    if (flag == 1)
    {
      image(replay, 710, 420, 80, 80);
        if (click == true && mouseButton == LEFT && mouseX > 710 && mouseX < 770 && mouseY > 420 && mouseY < 500){
          click = false;
          state = 1;
          flag = 0;
        }
    
      image(home, 660, 450, 50, 50);
        if (click == true && mouseButton == LEFT && mouseX > 660 && mouseX < 710 && mouseY > 450 && mouseY < 500){
          click = false;
          state = 0;
          flag = 0;
        }
        
      image(leave, 620, 510, 60, 60);
        if (click == true && mouseButton == LEFT && mouseX > 620 && mouseX < 680 && mouseY > 510 && mouseY < 570){
          click = false;
          exit();
        }
    }
  }
  else if(state == 4){
    background(bg);
    fill(241, 224, 255);
    textAlign(CENTER);
    textSize(50);
    text("Your points: " + point, 400, 300);
    rect(130, 350, 200, 100);
    rect(430, 350, 200, 100);
    fill(100);
    textAlign(CENTER);
    textSize(30);
    text("Try Again?", 230, 410);
    text("Quit", 530, 410);
    if (click == true && mouseButton == LEFT && mouseX > 130 && mouseX < 330 && mouseY > 350 && mouseY < 450)
    {
      click = false;
      state = 1;
      flag = 0;
    }
    if(click == true && mouseButton == LEFT && mouseX > 430 && mouseX < 630 && mouseY > 350 && mouseY < 450)
    {
      click = false;
      exit();
    }
    
    image(menu, 700, 500, 80, 80);
    if (click == true && mouseButton == LEFT && mouseX > 700 && mouseX < 780 && mouseY > 500 && mouseY < 580){
      click = false;
      flag++;
      if (flag > 1)
        flag = 0;
    }
    if (flag == 1)
    {
      image(replay, 710, 420, 80, 80);
        if (click == true && mouseButton == LEFT && mouseX > 710 && mouseX < 770 && mouseY > 420 && mouseY < 500){
          click = false;
          state = 1;
          flag = 0;
        }
    
      image(home, 660, 450, 50, 50);
        if (click == true && mouseButton == LEFT && mouseX > 660 && mouseX < 710 && mouseY > 450 && mouseY < 500){
          click = false;
          state = 0;
          flag = 0;
        }
        
      image(leave, 620, 510, 60, 60);
        if (click == true && mouseButton == LEFT && mouseX > 620 && mouseX < 680 && mouseY > 510 && mouseY < 570){
          click = false;
          exit();
        }
    }
  }
}
