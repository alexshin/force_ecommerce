public with sharing class CategoryEditController {

	private final Product_Category__c myCategory;

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public CategoryEditController(ApexPages.StandardController stdController) {
        this.myCategory = (Product_Category__c)stdController.getRecord();
    }


    public PageReference save() {
        try {
            upsert(myCategory);
        }
        catch (System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }

        PageReference redirectSuccess = new PageReference('/apex/CategoriesList');
        redirectSuccess.setRedirect(true);

        return redirectSuccess;
    }
}