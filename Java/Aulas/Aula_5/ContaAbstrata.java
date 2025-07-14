public abstract class ContaAbstrata {
    private String numero;
    private double saldo;

    public ContaAbstrata(String numero) {
        this.numero = numero;
        this.saldo = 0.0;
    }

    public void creditar(double valor) {
        this.saldo = this.saldo + valor;
    }

    public double getSaldo() {
        return saldo;
    }

    protected void setSaldo (double saldo) {
        this.saldo = saldo;
    }

    public abstract void debitar (double valor);
}
