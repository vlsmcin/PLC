public class Banco {
    private Conta[] contas;
    private int indice;
    private final double taxa = 0.01;

    public Banco() {
        contas = new Conta[100];
        indice = 0;
    }

    public void cadastrar(Conta c) {
        contas[indice] = c;
        indice++;
    }

    private Conta encontrarConta(String numero) {
        for (int i=0;i<indice;i++) {
            if (contas[i].getNumero().equals(numero)) {
                return contas[i];
            }
        }

        return null;
    }

    public void creditar(String numero, double value) {
        Conta c = encontrarConta(numero);

        if (c != null) {
            c.creditar(value);
        }
    }

    public void debitar(String numero, double value) {
        Conta c = encontrarConta(numero);

        if (c != null) {
            c.debitar(value);
        }
    }

    public double getSaldo(String numero) {
        Conta c = encontrarConta(numero);

        if (c != null) {
            return c.getSaldo();
        }

        return 0.0;
    }

    public void transferir(String conta1,String conta2, double valor) {
        Conta c1,c2;
        c1 = this.encontrarConta(conta1); 
        c2 = this.encontrarConta(conta2); 
        c1.debitar(valor); 
        c2.creditar(valor); 
    }
      
    public void renderJuros(String numero) {
        Conta c;
        c = this.encontrarConta(numero); 
        if (c instanceof Poupanca) {
            ((Poupanca) c).renderJuros(taxa);
        }
    }

    public void renderBonus(String numero) {
        Conta c = this.encontrarConta(numero);
        if (c instanceof ContaEspecial) {
            ((ContaEspecial) c).renderBonus();
        }
    }
}
