///@arg resolution
///@arg alpha
///@arg lightScale
///@arg radialBlurFactor
var resolution = argument0;
var alpha = argument1;
var lightScale = argument2;
var blur = argument3;

#region Tiles
if !variable_instance_exists(id,"occlusionMapTiles") occlusionMapTiles = noone;
if !surface_exists(occlusionMapTiles) 
{
	occlusionMapTiles = surface_create(room_width,room_height);
	surface_set_target(occlusionMapTiles);
		draw_clear_alpha(c_white,0);
		tileMapA = layer_tilemap_get_id(layer_get_id("tiles_occlusion"));
		draw_tilemap(tileMapA,0,0);
	surface_reset_target();
}
#endregion
#region Initializations
with obj_light_parent if enabled
{
	///// VARIABLES \\\\\
	if lightSize < 0 lightSize = 0;
	if maxLightSize < 0 maxLightSize = 0;
	col = make_color_rgb(255-color_get_red(colour),255-colour_get_green(colour),255-colour_get_blue(colour))

	///// SURFACE VARIABLES \\\\\
	if !variable_instance_exists(id,"occlusionMap") occlusionMap = noone;
	if !variable_instance_exists(id,"shadowMap1D") shadowMap1D = noone;
	
	///// CHECK SURFACES EXIST \\\\\
	if !surface_exists(shadowMap1D) shadowMap1D = surface_create(maxLightSize*lightScale,1);
	if !surface_exists(occlusionMap) occlusionMap = surface_create(maxLightSize*lightScale,maxLightSize*lightScale);

	///// CLEAR SURFACES \\\\\
	surface_set_target(shadowMap1D);
		draw_clear_alpha(c_white,0);
	surface_reset_target();
	surface_set_target(occlusionMap);
		draw_clear_alpha(c_white,0);
	surface_reset_target();
}
#endregion
#region Occlusion maps
shader_set(shd_black);
	with obj_light_parent if enabled
	{
		if lightSize != 0
		{			
				///// SPRITES AND COMBINE \\\\\
			surface_set_target(occlusionMap);
				draw_surface_ext(other.occlusionMapTiles,(-x+lightSize/2)*lightScale*(maxLightSize/lightSize),(-y+lightSize/2)*lightScale*(maxLightSize/lightSize),lightScale*(maxLightSize/lightSize),lightScale*(maxLightSize/lightSize),0,c_white,1);
				with objBlockParent if occlusion
				{
					draw_sprite_ext(sprite_index,image_index,(x-other.x+other.lightSize/2)*lightScale,(y-other.y+other.lightSize/2)*lightScale,image_xscale*lightScale*(maxLightSize/lightSize),image_yscale*lightScale*(maxLightSize/lightSize),image_angle,c_white,image_alpha)
				}
			surface_reset_target();
		}
	}
shader_reset();
#endregion
#region 1D shadow maps
shader_set(shd_cast_shadows);
var shd_resolution = shader_get_uniform(shd_cast_shadows,"resolution");
shader_set_uniform_f(shd_resolution,resolution,resolution);
	with obj_light_parent if enabled
	{
			///// DRAW SURFACE USING CASTER SHADER \\\\\
		surface_set_target(shadowMap1D);
			draw_surface(occlusionMap,0,0);
		surface_reset_target();
	}
shader_reset();
#endregion
#region Render light onto controller surface
shader_set(shd_render_light);
var shd_resolution = shader_get_uniform(shd_render_light,"resolution");
shader_set_uniform_f(shd_resolution,resolution,resolution);
var shd_blurFactor = shader_get_uniform(shd_render_light,"blurFactor");
shader_set_uniform_f(shd_blurFactor,blur);
	with obj_light_parent if enabled
	{
		///// DRAW LIGHT ONTO SURFACE \\\\\
		surface_set_target(LightingController.light);
			draw_surface_ext(
				shadowMap1D,
				(x-lightSize/2-camera_get_view_x(Camera.cam)+1)*lightScale,
				(y+lightSize/2-camera_get_view_y(Camera.cam)+1)*lightScale,
				lightSize/maxLightSize,
				-lightSize*lightScale,
				0,col,alpha);
		surface_reset_target();
	}
shader_reset();
#endregion