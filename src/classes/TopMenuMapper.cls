public with sharing class TopMenuMapper {
	private static Map<String, Map<String, String>> privateMenuItems = new Map<String, Map<String, String>>{
		'homepage' => new Map<String, String>{
			'title' => 'Homepage',
			'display' => 'true',
			'active'  => 'false',
			'url' => '/apex/homepage'
		},
		'manage_products' => new Map<String, String>{
			'title' => 'Manage products',
			'display' => 'true',
			'active' => 'false',
			'url' => '/apex/crud_products'
		}
	};


	public static Map<String, Map<String, String>> getMenuItems (String activeItem) {
		for (String slug: privateMenuItems.keySet()){
			Map<String, String> currentItem = privateMenuItems.get(slug); 
			if (slug == activeItem){
				currentItem.put('active', 'true');
			}
			else {
				currentItem.put('active', 'false');
			}
		}

		return privateMenuItems;
	}
}