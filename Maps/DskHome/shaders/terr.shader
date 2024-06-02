textures/system/terrain_base
{
	nopicmips
	q3map_lightmapaxis z
	q3map_lightmapmergable
	q3map_tcGen ivector ( 512 0 0 ) ( 0 512 0 )
}

textures/system/terrain_0
{
	q3map_baseshader textures/system/terrain_base
	qer_editorimage textures/photorealistic_ground/snow008.jpg
	{
		map textures/photorealistic_ground/snow008.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

