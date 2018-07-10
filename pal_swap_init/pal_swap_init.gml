globalvar Pal_Shader,Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture;
Pal_Shader = argument[0];
Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size");
Pal_UVs = shader_get_uniform(argument[0], "palette_UVs");
Pal_Index = shader_get_uniform(argument[0], "palette_index");
Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture");

