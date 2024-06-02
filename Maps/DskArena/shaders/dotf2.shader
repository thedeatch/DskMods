textures/jedi/energyside
{
	qer_editorimage	textures/jedi/energyside.tga
	surfaceparm	nodamage
	surfaceparm	nomarks
	surfaceparm	forcefield
	surfaceparm	trans
	q3map_material	Glass
	q3map_nolightmap
	cull	disable
    {
        map textures/jedi/energystatic2
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.1 0.01 0.5
        tcMod scroll 0.2 0
        tcMod turb 0 1 0 1
    }
    {
        map textures/jedi/energy2
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.1 0.01 0.5
        tcMod scroll 1 0
        tcMod turb 0 0 0 0.5
    }
    {
        map textures/jedi/energyside
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.1 0.01 0.5
    }
    {
        map textures/jedi/energyside3
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.1 0.01 0.5
    }
}

textures/jeden/jedienergy
{
	qer_editorimage	textures/jeden/jedienergy.tga
	surfaceparm	trans
	q3map_material	Glass
	q3map_nolightmap
	cull	disable
    {
        map textures/jeden/jedienergy
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.07 0 0.9
        tcMod scale -1 1
        tcMod scroll 0 -0.5
    }
    {
        map textures/jeden/jedienergy2
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.1 0.5 0.09 0.6
        tcMod scale -2 2
        tcMod scroll 0 -0.2
    }
    {
        map textures/jeden/jedienergy3
        blendFunc GL_ONE GL_ONE
        rgbGen wave noise 0.9 0.1 0.09 0.9
        tcMod scale -2 -2
        tcMod scroll 0 1
    }
    {
        map textures/jeden/jedienergy
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
        tcMod scroll 0 -1
    }
}

textures/jeden/tubein1
{
	qer_editorimage	textures/jeden/tubein1.tga
	surfaceparm	nonopaque
	q3map_nolightmap
	cull	disable
    {
        map textures/jeden/tubein1
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthFunc equal
        rgbGen wave sin 0 5 0 5
        alphaGen wave sin 0 1 0 1
        tcMod scale 2 5
        tcMod scroll 0 -3
    }
    {
        map textures/jeden/tubein1
        blendFunc GL_ONE GL_ONE
        tcMod scale 2 1
        tcMod scroll 0 -1.5
    }
}

textures/jeden/tubein3
{
	lightcolor	( 0.8 1 1 )
	qer_editorimage	textures/jeden/tubein3.tga
	surfaceparm	trans
	q3map_nolightmap
	cull	disable
    {
        map textures/jeden/tubein3
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 2 10 0 10
        tcMod scale -1 1
        tcMod scroll 0 -0.6
    }
    {
        map textures/jeden/tubein3
        blendFunc GL_ONE GL_ONE
        depthWrite
        detail
        rgbGen wave sin 0 5 0 1
        alphaGen wave sin 0 1 0 1
        tcMod scale -0.8 0.8
        tcMod scroll 0 -0.2
    }
}

