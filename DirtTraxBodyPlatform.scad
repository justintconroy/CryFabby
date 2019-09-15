include <relativity.scad>;

module plate(size = [200,160,3],corner_radius=10)
{
    hulled()
    {
        mirrored(x)
        mirrored(y)
        translated((size[0]/2 - corner_radius)*x+(size[1]/2 - corner_radius)*y)
        rod(d=corner_radius*2,h=size[2]);
    }
    children();
};

module peg(d=10,h=20,hole_diam=5,hole_depth=5)
{
    differed("hole", "not(hole)",$class="peg")
    {
        rod(d=d,h=h, $fn=100)
        align(top)
        rod(d=hole_diam,h=hole_depth,anchor=top,$fn=100,$class="hole");
    }
}

module posts()
{
    // Front post
    translated(78.5*x,$class="posts")
    peg(d=6,h=22,hole_diam=2,hole_depth=7);
    
    // Back posts
    translated(-44.5*x)
    translated(67*y, [1,-1]/2)
    peg(d=5,h=7,hole_diam=2,hole_depth=7);
};


align(bottom)
differed("hole","not(hole)")
{
    plate([170,150,3],60)
    align(bottom)
    {
        translated(x,[-65,-50,-35,-20,-5,10,25,40,55])
        plate([10,60,3],5, anchor=bottom,$class="hole");
        
        translated(y,[-64,-52,-40,40,52,64])
        plate([70,8,3],4, anchor=bottom,$class="hole");
    }
}

align(top)
//translated(-15*x)
posts();

//plate([60,40,3],10);