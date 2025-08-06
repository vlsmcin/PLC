import java.util.ArrayList;
import java.util.Comparator;

public class Menu {
    private ArrayList<Cliente> fila;

    public void adicionarCliente(String tipo, String nome) {
        Cliente c;
        if (tipo.equals("NORMAL")) {
            c = new ClienteNormal(nome);
        }
        else {
            c = new ClientVIP(nome);
        }
        fila.add(c);
    }

    public void adicionarCompra(String tipo, String nome, int qtdProdutos, double preco) {
        for (int i=0;i<fila.size();i++) {
            if (fila.get(i).getNome().equals(nome)) {
                fila.get(i).renderBonus(preco, qtdProdutos);
            }
        }
    }

    public void finalizarPromocao() {
        fila.sort(Comparator.comparing(Cliente::getPontos).reversed());
        for (int i=0;i<fila.size();i++) {
            System.out.println(fila.get(i).getNome() + "TIPO: VIP" + fila.get(i).getPontos());
        }
    }
}
