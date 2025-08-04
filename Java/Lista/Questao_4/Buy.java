public class Buy {
    private Cart chart;

    public Buy() {
        chart = new Cart();
    }

    public void addItemToChart(Items item) { //Add item ao carrinho
        try {
            chart.addItem(item);
        }
        catch (NotEnoughSpace e) {
            System.out.println(e);
        }
        catch (ItemAlreadyExists e) {
            System.out.println(e);
        }
        catch (NullParameters e) {
            System.out.println(e);
        }
    }

    public void removeItemFromChart(String name) { //Remove item pelo nome
        try {
            chart.removeItem(name);
        }
        catch (NotFound e) {
            System.out.println(e);
        }
        catch (NullParameters e) {
            System.out.println(e);
        }
    }

    public void searchItemInChart(String name) { //Pesquisa item pelo nome
        try {
            String result = chart.searchItem(name);
            System.out.println(result);
        }
        catch (NotFound e) {
            System.out.println(e);
        }
        catch (NullParameters e) {
            System.out.println(e);
        }
    }

    public void displayChartItems() { //Print de todos itens no carrinho
        chart.getItems();
    }

}
