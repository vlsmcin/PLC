public class TestaFila {
    // Tem que fazer com try catch também
    public static void main() {
        Fila<Integer> q1 = new Fila <Integer>();
        q1.insere(3);
        q1.insere(5);
        q1.remove();

        Fila<String> q2 = new Fila();
        q2.insere("teste");
        q2.insere("Safe");
        q2.remove();
    }
}
