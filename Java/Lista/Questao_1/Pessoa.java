public abstract class Pessoa implements Comparable<Integer> {
    private Integer idade;
    private String nome;

    public Pessoa(Integer idade, String nome) {
        this.idade = idade;
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public Integer getIdade() {
        return idade;
    }

    public Integer compareTo(Pessoa pessoa) {
        return this.idade - pessoa.idade;
    }

    public String toString() {
        return nome + ":" + idade.toString() + "[" + getTicketType() + "]";
    }

    protected abstract Ticket getTicketType();
}
