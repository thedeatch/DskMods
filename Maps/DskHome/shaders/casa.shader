textures/tree/snowtree_c02a
{
	q3map_nolightmap
	q3map_onlyvertexlighting
	cull	disable
    	{
        	map textures/tree/snowtree_c02a
        	alphaFunc GE128
        	rgbGen const ( 0.400000 0.400000 0.450000 )
    	}
}

textures/tree/snowtree_xmas
{
	q3map_nolightmap
	q3map_onlyvertexlighting
	cull	disable
    	{
        	map textures/tree/snowtree_xmas
        	alphaFunc GE128
        	rgbGen const ( 0.400000 0.400000 0.450000 )
    	}
	{
		map textures/tree/snowtree_red
		rgbGen wave sin 0 3 0 1.5 
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/tree/snowtree_blue
		rgbGen wave sin 0 3 0 1.3 
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/tree/snowtree_green
		rgbGen wave sin 0 3 0 1.1 
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/tree/snowtree_yel
		rgbGen wave sin 0 3 0 1.0 
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/tree/snowtree_purp
		rgbGen wave sin 0 3 0 1.2 
		blendFunc GL_ONE GL_ONE
	}
}

textures/mysky/sky
{
qer_editorimage textures/skies/sky.tga
surfaceparm sky
surfaceparm noimpact
surfaceparm nomarks
notc
q3map_nolightmap
skyParms textures/mysky/mysky 512 -
} 

textures/mysky/sky_light
{
qer_editorimage textures/skies/sky.tga
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

textures/casa/casa_water
{
	qer_editorimage	textures/casa/casa_water
	surfaceparm	metalsteps
	surfaceparm	nonsolid
	surfaceparm	nonopaque
	surfaceparm	water
	surfaceparm	fog
	surfaceparm	trans
	q3map_material	Water
	q3map_nolightmap
	q3map_onlyvertexlighting
	fogparms	( 0.113725 0.137255 0.380392 ) 1024.0
    {
        map textures/casa/casa_water
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        rgbGen exactVertex
        alphaGen const 0.2
        tcMod scroll 0.005 0.01
        tcMod turb 1 0.03 0 0.3
    }
    {
        map textures/casa/casa_water
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen exactVertex
        alphaGen const 0.2
        tcMod scroll -0.005 -0.01
        tcMod turb 0 -0.03 0.5 -0.3
    }
}

