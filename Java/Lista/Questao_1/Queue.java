import java.util.ArrayList;

public class Queue<T extends Pessoa> {
    private ArrayList<T> fila;

    public Queue() {
        this(10);
    }

    public Queue(int capacidade) {
        fila = new ArrayList<T>(capacidade);
    }

    public void push(T pessoas) {
        for (int i=0;i<fila.size();i++) {
            if (fila.get(i).compareTo(pessoas) < 0) {
                fila.add(i, pessoas);
                return;
            }
        }

        fila.add(fila.size(), pessoas);
    }

    public T pop() {
        T ret = fila.get(0);
        fila.remove(0);
        return ret;
    }

    public boolean isEmpty() {
        return fila.size() == 0;
    }
}
