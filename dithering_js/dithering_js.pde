//variable to store image
PImage theImageCarrier; 

void setup(){
  
  //size of the output window displaying the image
  size(1100  ,512); 
  
  //loading the image into the variable
  theImageCarrier = loadImage("nature1.jpg"); 
  
  //theImageCarrier.filter(GRAY); //turning the image into gray scale 
  
  //displaying the image on the left half of output window
  image(theImageCarrier,0,0);
  
}

int index(int x, int y){
   return x + y * theImageCarrier.width; 
}

void draw() {
  //before working on pixels u load them
  theImageCarrier.loadPixels();
  
  //look at all of the pixels

  for(int y=0; y< theImageCarrier.height-1; y++)//all y values of the image
  {  
     for(int x=1; x<theImageCarrier.width-1; x++) //all x values of the image
     {
       //look at a given pixel from the image
       color pix = theImageCarrier.pixels[index(x,y)];
       
       //pull out the red,green and blue value from the pixel
       float oldR = red(pix);
       float oldG = green(pix);
       float oldB = blue(pix);
       
      //divide the color scale into only "factor" parts
      int factor = 1; 
      
      //quantise the values to a shorter range of values
      int newR = round(factor * oldR/255) * (255/factor);
      int newG = round(factor * oldG/255) * (255/factor);
      int newB = round(factor * oldB/255) * (255/factor);
      
      //set it back to that pixel
      theImageCarrier.pixels[index(x,y)] = color(newR,newG,newB);
      
   //Dithering algo for pixel correction begins from here
      
      //errors for each color after quantization 
      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;
      
      
      //case1
      int index = index(x+1,y);
      color c = theImageCarrier.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      //pass the error onto the current color and then update the pixels
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      theImageCarrier.pixels[index] = color(r,g,b);
      
      //case2
      index = index(x-1,y+1);
      c = theImageCarrier.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      //pass the error onto the current color and then update the pixels
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      theImageCarrier.pixels[index] = color(r,g,b);
      
      
      //case3
      index = index(x,y+1);
      c = theImageCarrier.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      //pass the error onto the current color and then update the pixels
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      theImageCarrier.pixels[index] = color(r,g,b);
      
      
      //case4
      index = index(x+1,y+1);
      c = theImageCarrier.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      //pass the error onto the current color and then update the pixels
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      theImageCarrier.pixels[index] = color(r,g,b);
      
   //Dithering algo ends here
      
     /*
      pixel[x + 1][y    ] := pixel[x + 1][y    ] + quant_error * 7 / 16
      pixel[x - 1][y + 1] := pixel[x - 1][y + 1] + quant_error * 3 / 16
      pixel[x    ][y + 1] := pixel[x    ][y + 1] + quant_error * 5 / 16
      pixel[x + 1][y + 1] := pixel[x + 1][y + 1] + quant_error * 1 / 16
     */
     }
  }
  
  //after working you update the image pixels
  theImageCarrier.updatePixels();
  
  //quantized image on the right
  image(theImageCarrier , 512,0);
}
