public class ClienteNormal extends Cliente {
    public ClienteNormal(String nome) {
        super(nome);
    }

    public void renderBonus(double preco, int qtdItem) {
        pontos = super.pontosSemBonus(preco, qtdItem);
    }
}
