public class Main {
    public static void main(String[] args) {
        Automovel carro = new Automovel(50, TipoMotor.GASOLINA);
        Etanol bombaEtanol = new Etanol(4.5);
        Gasolina bombaGasolina = new Gasolina(5.8);

        try {
            bombaEtanol.abastecer(carro, 40);
        }
        catch (CombustivelNaoCompativel e) {
            System.out.println(e);
        }
        catch (CombustivelOverflow e) {
            System.out.println(e);
        }

        try {
            bombaGasolina.abastecer(carro, 60);
        }
        catch (CombustivelNaoCompativel e) {
            System.out.println(e);
        }
        catch (CombustivelOverflow e) {
            System.out.println(e);
        }

        try {
            bombaGasolina.abastecer(carro, 40);
            System.out.println("Quantidade de litros antes do ajuste: " + carro.getCombustivelAtual());
            bombaGasolina.calcularCusto(40);
            bombaGasolina.ajustarPreco(6.00);
            bombaGasolina.abastecer(carro, 5);
            System.out.println("Quantidade de litros depois do ajuste: " + carro.getCombustivelAtual());
            bombaGasolina.calcularCusto(5);
        }
        catch (CombustivelNaoCompativel e) {
            System.out.println(e);
        }
        catch (CombustivelOverflow e) {
            System.out.println(e);
        }
    }
}
