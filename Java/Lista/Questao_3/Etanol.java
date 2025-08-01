public class Etanol implements BombaCombustivel {
    private double precoLitro;

    public Etanol(double precoLitro) {
        this.precoLitro = precoLitro;
    }

    @Override
    public void abastecer(Automovel automovel, double quantidadeLitros) throws CombustivelNaoCompativel, CombustivelOverflow {
        if (automovel.getMotor() == TipoMotor.GASOLINA) {
            throw new CombustivelNaoCompativel();
        }
        automovel.setCombustivelAtual(automovel.getCombustivelAtual() + quantidadeLitros);
    }

    @Override
    public void calcularCusto(double quantidadeLitros) {
        System.out.println("Tipo do combustível: " + TipoMotor.ETANOL + "\nQuantidade abastecida: " + quantidadeLitros + "\nCusto: " + quantidadeLitros*precoLitro);
    }

    @Override
    public void ajustarPreco(double novoPreco) {
        precoLitro = novoPreco;
    }
}
