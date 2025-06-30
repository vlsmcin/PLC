public class Produto {
    private String description;
    private int real;
    private int qtdEstoque;

    public Produto(String productName, int price, int qtd) {
        description = productName;
        real = price;
        qtdEstoque = qtd;
    }

    public void changePrice(int value) {
        real = value;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return real;
    }

    public void addEstoque(int qtd) {
        qtdEstoque += qtd;
    }

}
