textures/mysky/sky
{
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nomarks
	notc
	q3map_nolightmap
	skyParms textures/mysky/mysky 512 -
} 
textures/mysky/sky_light
{
	q3map_skylight 100 3
	q3map_sun .5 .5 1 60 100 120
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nomarks
	notc
	q3map_nolightmap
	skyParms textures/mysky/mysky 512 -
} 
textures/casa/flat_yellow
{
	q3map_surfacelight	3000
	q3map_nolightmap
    {
        map textures/casa/flat_yellow
    }
}
