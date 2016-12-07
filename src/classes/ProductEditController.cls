public with sharing class ProductEditController {

	private final Product__c myProduct;

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public ProductEditController(ApexPages.StandardController stdController) {
        this.myProduct = (Product__c)stdController.getRecord();
    }


    public PageReference save() {
        try {
            upsert(myProduct);
        }
        catch (System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }

        PageReference redirectSuccess = new PageReference('/apex/crud_products');
        redirectSuccess.setRedirect(true);

        return redirectSuccess;
    }
}