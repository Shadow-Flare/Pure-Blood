if !surface_exists(mapSurface)
{
	mapSurface = surface_create((maxCellsX-cellStartX)*mapCellW,(maxCellsY-cellStartY)*mapCellH);
	redraw_map();
}