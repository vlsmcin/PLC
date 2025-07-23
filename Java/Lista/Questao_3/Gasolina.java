public class Gasolina implements BombaCombustivel{
    private double precoLitro;

    public Gasolina(double precoLitro) {
        this.precoLitro = precoLitro;
    }

    public void abastecer(Automovel automovel, double quantidadeLitros) {
        automovel.setCombustivelAtual(automovel.getCombustivelAtual() + quantidadeLitros);
    }

    public void calcularCusto(double quantidadeLitros) {
        System.out.println("Tipo do combustível: " + TipoMotor.GASOLINA + "\nQuantidade abastecida: " + quantidadeLitros + "\nCusto: " + quantidadeLitros*precoLitro);
    }

    public void ajustarPreco(double novoPreco) {
        precoLitro = novoPreco;
    }

}
