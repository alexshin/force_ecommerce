public class DataFixtures {
	public static void LoadFixtures(){
		LoadCategories();
		LoadProducts();
	}

	private static void LoadCategories(){
		List<Product_Category__c> categories = new List<Product_Category__c>();
		
		categories.add(new Product_Category__c(Name='Books'));
		categories.add(new Product_Category__c(Name='Clothing'));
		categories.add(new Product_Category__c(Name='Computers'));
		categories.add(new Product_Category__c(Name='Health & Beauty'));
		categories.add(new Product_Category__c(Name='Jewelry'));
		categories.add(new Product_Category__c(Name='Music'));
		categories.add(new Product_Category__c(Name='Sport'));

		insert categories;
	}


	private static void LoadProducts(){
		List<Product__c> products = new List<Product__c>();

		for(Integer i = 1; i < 100; i++){
			products.add(new Product__c(Name='Product ' + i, Code__c='PRODUCT-' + i));
		}

		insert products;
	}
}