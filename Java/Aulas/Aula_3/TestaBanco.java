public class TestaBanco {
    public static void main(String[] args) {
        Poupanca poupanca = new Poupanca("123");
        poupanca.creditar(100);
        poupanca.renderJuros(0.05);

        Banco b = new Banco();
        Conta c = new Conta("2323232");
        b.cadastrar(c);
        b.cadastrar(poupanca);

        System.out.println(b.getSaldo("123"));
    }    
}
