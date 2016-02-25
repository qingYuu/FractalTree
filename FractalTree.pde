private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0;  
public void setup() 
{   
	size(640,480);    
	 
} 
public void draw() 
{   
	//background(0);   
	stroke(255,0,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);
	if(branchAngle<1)
		branchAngle= branchAngle+0.1;  //will add later 
	else
		branchAngle=0;
	
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here
	double angle1, angle2;
	int endX1, endY1, endX2, endY2;
	angle1 = angle+branchAngle;
	angle2 = angle-branchAngle;
	branchLength = branchLength*fractionLength;
	endX1 = (int)(branchLength*Math.cos(angle1) + x);
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);
    endY2 = (int)(branchLength*Math.sin(angle2) + y);
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if(branchLength>=smallestBranch)
    {
    	drawBranches(endX1,endY1,branchLength,angle1);
    	drawBranches(endX2,endY2,branchLength,angle2);
    } 
} 
public void mouseMoved() 
{   
	double o=(Math.random()*144);
	double e=(Math.random()*234);
	double k=(Math.random()*96);
	double g=(Math.random()*200);
	color c = color ((int)o-100,(int)e-20,(int)g-10,(int)k-155);
	noStroke();
	mana(mouseX+30,mouseY+30,120,120, c);
	redraw(); 


}

public void mana(int x, int y, int wid, int hei, int c) 
{
	//ellipse(x, y, wid, hei);
	if(wid <= 100)
	{ 
		fill(c);
		ellipse(x,y,wid,hei);
	}
	else 
	{
		mana(x-wid/2, y+hei/2, wid/2, hei/2, c);
	 	mana(x+wid/4, y+hei/4, wid/4, hei/4, c);
	 	// mana(x+wid/6, y-hei/6, wid/6, hei/6, c);
	 	mana(x-wid/8, y-hei/8, wid/8, hei/8, c);
	}
	noLoop();
}
