DROP FUNCTION layer_mtb(geometry,integer);
CREATE OR REPLACE FUNCTION layer_mtb(bbox geometry, zoom_level int)
RETURNS TABLE(osm_id bigint, geometry geometry, class text, mtb_scale text, sac_scale text, surface text, width text, name text) AS $$
    SELECT osm_id, geometry, class, mtb_scale, sac_scale, surface, width, name
    FROM osm_mtb_linestring
    WHERE zoom_level >= 10 AND geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;
