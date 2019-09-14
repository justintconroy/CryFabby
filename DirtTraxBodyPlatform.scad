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

module posts()
{
    // Front post
    translated([64+12+7-2-2.5,0,0])
    rod(d=5+1, h=32-10, $fn=100);
    
    // Back right post
    translated([-30-12-2.5,36+2-4-.5,0])
    rod(d=5, h=7, $fn=100);
    
    // Back left post
    translated([-30-12-2.5,-36-2+4+.5,0])
    rod(d=5, h=7, $fn=100);
};


align(bottom)
differed("hole", "not(hole)")
{
plate([135,80,3],10);
plate([118,60,3],10, $class="hole");
}

translated(-15*x)
align(top)
posts();