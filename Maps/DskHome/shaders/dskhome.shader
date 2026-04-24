textures/blueice_nightfall/nightfall_roof
{
	q3map_editorimage textures/blueice_nightfall/nightfall_roof
	{
		map $lightmap
		rgbGen identity 
	}
	{
		map textures/blueice_nightfall/nightfall_roof
		blendFunc filter
	}
	{
		map textures/blueice_nightfall/nightfall_roof_glow
		blendFunc add
		glow
	}
}
textures/blueice_nightfall/nightfall_plaster2
{
	qer_editorimage	textures/blueice_nightfall/nightfall_plaster2
	q3map_shadeangle 90
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/blueice_nightfall/nightfall_plaster2
        blendFunc filter
    }
}
textures/blueice_nightfall/nightfall_snow
{
   	q3map_editorimage textures/blueice_nightfall/nightfall_snow
	q3map_normalimage textures/blueice_nightfall/nightfall_snow_bumpmap
   	q3map_lightmapsamplesize 2x2
	q3map_material Snow
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/blueice_nightfall/nightfall_snow
		blendFunc filter
	}
	{
		map textures/blueice_nightfall/nightfall_snow_glow
		blendFunc add
		glow
	}
	{
		map textures/blueice_nightfall/nightfall_snow_enviro
  		rgbGen const ( 0.00 0.00 0.00 )
		blendFunc add
		tcGen environment
		glow
	}
}
textures/blueice_nightfall/nightfall_wall2
{
	q3map_editorimage textures/blueice_nightfall/nightfall_wall2
	q3map_shadeangle 60
	{
		map $lightmap
		rgbGen identity 
	}
	{
		map textures/blueice_nightfall/nightfall_wall2
		blendFunc filter
	}
}
textures/blueice_nightfall/nightfall_stone3
{
	q3map_editorimage textures/blueice_nightfall/nightfall_stone3
	q3map_normalimage textures/blueice_nightfall/nightfall_stone3_bumpmap
   	q3map_lightmapsamplesize 2x2
	q3map_shadeangle 120
	{
		map $lightmap
		rgbGen identity 
	}
	{
		map textures/blueice_nightfall/nightfall_stone3
		blendFunc filter
	}
}
textures/blueice_nightfall/nightfall_wood2_snow
{
	q3map_editorimage textures/blueice_nightfall/nightfall_wood2_snow
	q3map_normalimage textures/blueice_nightfall/nightfall_wood2_snow_bumpmap
   	q3map_lightmapsamplesize 1x1
	q3map_lightmapSize 1024 1024
	surfaceparm nodlight
	{
		tcgen lightmap
		map $lightmap
		rgbGen identity 
	}
	{
		map textures/blueice_nightfall/nightfall_wood2_snow
		blendFunc filter
	}
	{
		map textures/blueice_nightfall/nightfall_wood2_snow_glow
		blendFunc add
		glow
	}
}
textures/blueice_nightfall/nightfall_herbs
{
	qer_editorimage textures/blueice_nightfall/nightfall_herbs
	qer_trans 1.0
	notc
	surfaceparm nonopaque
	surfaceparm trans
	polygonOffset
    { 
	map textures/blueice_nightfall/nightfall_herbs
	alphaFunc GE128
	depthWrite
    } 
    { 
	map $lightmap
	depthFunc equal
    } 
    {
	map textures/blueice_nightfall/nightfall_herbs
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
    }
}
textures/blueice_nightfall/nightfall_pipe
{
	qer_editorimage	textures/blueice_nightfall/nightfall_pipe
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/blueice_nightfall/nightfall_pipe
		blendFunc filter
	}
	{
		map textures/blueice_nightfall/nightfall_pipe_enviro
		tcGen environment
		blendfunc add
		glow
	}
}
textures/blueice_nightfall/nightfall_ornament_reverse
{
	qer_editorimage	textures/blueice_nightfall/nightfall_ornament_reverse
	qer_trans 1.0
	surfaceparm	nonopaque
	surfaceparm	trans
	cull twosided
	{
		map textures/blueice_nightfall/nightfall_ornament_reverse
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
	{ 
		map $lightmap
		rgbGen identity 
		blendFunc filter 
		depthFunc equal 
	}
}
textures/blueice_nightfall/nightfall_lantern
{	
	qer_editorimage	textures/blueice_nightfall/nightfall_lantern
	q3map_surfacelight 7500
	q3map_lightRGB 1.0 1.0 0.8
	{
		map $lightmap
   	}
    	{
        	map textures/blueice_nightfall/nightfall_lantern
        	blendFunc filter
    	}
    	{
        	map textures/blueice_nightfall/nightfall_lantern_glow
        	blendFunc add
        	glow
        	rgbGen identity
    	}
}
textures/blueice_nightfall/nightfall_lantern_flare
{
	qer_editorimage	textures/blueice_nightfall/nightfall_lantern_flare
	qer_trans 0.5
	qer_nocarve
	surfaceparm	nomarks
	surfaceparm	nonsolid
	surfaceparm	nonopaque
	surfaceparm	trans
	q3map_nolightmap
	cull	twosided
	deformVertexes autosprite
	{
		map textures/blueice_nightfall/nightfall_lantern_flare
		blendFunc add
		glow
		alphaGen portal 256
	}
}
textures/chicagostreets_jo/szico_chicagopcstand
{
	qer_editorimage	textures/chicagostreets_jo/szico_chicagopcstand.jpg
    {
        map $lightmap
    }
    {
        map textures/chicagostreets_jo/szico_chicagopcstand.jpg
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/chicagostreets_jo/szico_chicagoenviro.jpg
        blendFunc GL_DST_COLOR GL_ONE
        tcGen environment
    }
}