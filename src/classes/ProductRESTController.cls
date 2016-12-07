@RestResource(urlMapping='/product/*')
global with sharing class ProductRESTController  {

    @HttpGet
    global static Map<String, List<sObject>> getCategoriesList() {
        List<Product_Category__c> categories = getAllCategories();
        List<Product__c> products = getAllProducts();
        List<CategoryProducts__c> relations = getAllRelations(categories, products);

        return new Map<String, List<sObject>>{
            'categories' => categories,
            'products' => products,
            'relations' => relations
        };
    }


    public static List<Product__c> getAllProducts(){
        return [
            SELECT Id, Code__c, Name, Description__c, Total__c, Price__c 
            FROM Product__c 
            WHERE 
                IsActive__c = true AND
                Id IN (
                    SELECT Product__c
                    FROM CategoryProducts__c
                    WHERE Product__r.IsActive__c = true
                )
            ORDER BY Name
        ];
    }


    public static List<Product_Category__c> getAllCategories(){
        return [
            SELECT Id, Name
            FROM Product_Category__c
            WHERE 
                IsActive__c = true AND
                Id IN (
                    SELECT Category__c
                    FROM CategoryProducts__c
                    WHERE Category__r.IsActive__c = true
                )
            ORDER BY Name
        ];
    }


    public static List<CategoryProducts__c> getAllRelations(List<Product_Category__c> categories, List<Product__c> products){
        return [
            SELECT Category__c, Product__c
            FROM CategoryProducts__c
            WHERE 
                Category__c IN :categories AND
                Product__c IN : products
        ];
    }
}