public abstract class Cliente {
    protected double pontos;
    protected String nome;

    public Cliente(String nome) {
        pontos = 0;
    }

    protected int pontosSemBonus(double preco, int qtdItem) {
        this.pontos = Math.round((preco / 10) * qtdItem);
    }

    public abstract void renderBonus(double preco, int qtdItem);

    public String getNome() {
        return nome;
    }

    public double getPontos() {
        return pontos;
    }
}
