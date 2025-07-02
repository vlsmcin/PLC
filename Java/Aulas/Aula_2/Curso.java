public class Curso {
    private String cod;
    private String nome;

    public Curso(String nome,String cod) {
        this.cod = cod;
        this.nome = nome;
    }

    public String getCod() {
        return cod;
    }

    public String getNome() {
        return nome;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
