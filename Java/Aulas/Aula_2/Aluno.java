public class Aluno {
    private String nome;
    private String cpf;
    private int idade;
    private Curso curso;

    public Aluno(String nome,String cpf,int idade,Curso curso) {
        this.nome = nome;
        this.cpf = cpf;
        this.idade = idade;
        this.curso = curso;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public int getIdade() {
        return idade;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
}
