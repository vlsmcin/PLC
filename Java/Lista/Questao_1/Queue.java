import java.util.ArrayList;

public class Queue<T extends Pessoa> {
    private ArrayList<T> fila;

    public Queue() {
        this(10);
    }

    public Queue(int capacidade) {
        fila = new ArrayList<>(capacidade);
    }

    public T push(T pessoas) {
        
    }
}
