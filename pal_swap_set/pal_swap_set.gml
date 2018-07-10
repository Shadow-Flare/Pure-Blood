/// @description pal_swap_set(palette_sprite_index, palette_index);
/// @function pal_swap_set
/// @param palette_sprite_index
/// @param  palette_index
shader_set(shd_palette);
var _pal_sprite=argument[0];
var _pal_index=argument[1];


{   //Using a sprite based palette

    var tex = sprite_get_texture(_pal_sprite, _pal_index);
    var UVs = sprite_get_uvs(_pal_sprite, _pal_index);
    
    texture_set_stage(Pal_Texture, tex);
    gpu_set_texfilter_ext(Pal_Texture, 1)
    
    var texel_x = texture_get_texel_width(tex);
    var texel_y = texture_get_texel_height(tex);
    var texel_hx = texel_x * 0.5;
    var texel_hy = texel_y * 0.5;
    
    shader_set_uniform_f(Pal_Texel_Size, texel_x, texel_y);
    shader_set_uniform_f(Pal_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
    shader_set_uniform_f(Pal_Index, _pal_index);
}