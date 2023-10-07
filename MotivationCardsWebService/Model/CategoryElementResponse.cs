namespace MotivationCardsWebService.Model;

public class CategoryElementResponse {
    public List<string> getUniqueElementsOfCategory() {
        var elements = new List<string>();

        for(int i = 0; i < 10; i++) {
            elements.Add("element " + (i + 1));
        }

        return elements;
    }

    public List<string> getQuotesForElementOfCategory() {
        var elements = new List<string>();

        for(int i = 0; i < 100; i++) {
            elements.Add("element " + (i + 1));
        }

        return elements;
    }
}