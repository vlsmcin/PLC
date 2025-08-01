public class Gasolina implements BombaCombustivel{
    private double precoLitro;

    public Gasolina(double precoLitro) {
        this.precoLitro = precoLitro;
    }

    @Override
    public void abastecer(Automovel automovel, double quantidadeLitros) throws CombustivelNaoCompativel, CombustivelOverflow {
        if (automovel.getMotor() == TipoMotor.ETANOL) {
            throw new CombustivelNaoCompativel();
        }
        automovel.setCombustivelAtual(automovel.getCombustivelAtual() + quantidadeLitros);
    }

    @Override
    public void calcularCusto(double quantidadeLitros) {
        System.out.println("Tipo do combustível: " + TipoMotor.GASOLINA + "\nQuantidade abastecida: " + quantidadeLitros + "\nCusto: " + quantidadeLitros*precoLitro);
    }

    @Override
    public void ajustarPreco(double novoPreco) {
        precoLitro = novoPreco;
    }

}
