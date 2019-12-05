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

module posts(sp=[92,80], h=[22,22])
{
    // Front post
    translated(sp[0]/2*x,$class="posts")
    peg(d=6,h=h[0],hole_diam=2.5,hole_depth=7);

    // Back posts
    translated(-sp[0]/2*x)
    translated(sp[1]*y, [1,-1]/2)
    peg(d=5,h=h[1],hole_diam=2.5,hole_depth=7);
};


align(bottom)
differed("hole","not(hole)")
{
    plate([103,95,3])
    {
        align(top)
        posts();

        align(bottom)
        plate([80,75,3], $class="hole");
    }
}

