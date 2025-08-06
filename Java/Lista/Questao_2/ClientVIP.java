public class ClientVIP extends Cliente{
    public ClientVIP(String nome) {
        super(nome);
    }

    private double bonusVIP(double preco) {
        return Math.floor(preco/10);
    }

    public void renderBonus(double preco, int qtdItem) {
        Math.ceil(1+ bonusVIP(preco) *pontosSemBonus(preco, qtdItem));
    }
}
