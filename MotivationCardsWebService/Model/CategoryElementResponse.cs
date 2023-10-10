namespace MotivationCardsWebService.Model;

public class CategoryElementResponse {
    public List<string> getUniqueElementsOfCategory() {
        var elements = new List<string>() {
            "Author",
            "Category",
            "Gender"
        };

        //for(int i = 0; i < 10; i++) {
        //    elements.Add("element " + (i + 1));
        //}

        return elements;
    }

    public List<string> getQuotesForElementOfCategory(string category) {
        var elements = new List<string>();

        // TODO: SELECT * FROM quotes WHERE category=categoryValue
        // TODO: you need to send both category name and value, for example categoryName is gender, and category value is gender
        for(int i = 0; i < 100; i++) {
            elements.Add("element " + (i + 1));
        }

        return elements;
    }
}