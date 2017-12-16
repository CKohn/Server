resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
 
files {
    'carvariations.meta',
    'dlctext.meta',
    'handling.meta',
    'vehicles.meta',
	'carcols.meta',
	'vehiclelayouts.meta',
	'shop_vehicle.meta',
	'zbikecontentunlocks.meta'
}
 
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'DLCTEXT_FILE' 'dlctext.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_LAYOUTS_FILE''vehiclelayouts.meta'
data_file 'SHOP_VEHICLE_FILE''shop_vehicle.meta'
data_file 'ZBIKE_CONTENT_UNLOCKS_FILE''zbikecontentunlocks.meta'

 
client_script 'vehicle_names.lua'