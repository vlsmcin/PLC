public abstract class Cliente {
    protected double pontos;
    protected String nome;

    public Cliente(String nome) {
        pontos = 0;
    }

    protected double pontosSemBonus(double preco, int qtdItem) {
        return Math.round((preco / 10) * qtdItem);
    }

    public abstract void renderBonus(double preco, int qtdItem);

    public String getNome() {
        return nome;
    }

    public double getPontos() {
        return pontos;
    }
}
