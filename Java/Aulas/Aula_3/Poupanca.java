public class Poupanca extends Conta {
    public Poupanca (String numero) {
        super(numero, 0);
    }

    public void renderJuros (double taxa) {
        double juros = this.getSaldo() * taxa;
        this.creditar(juros);
        // tem como fazer super.creditar(juros);
    }
}
