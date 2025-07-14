public interface RepositorioContas {
    void inserir (ContaAbstrata conta);
    ContaAbstrata procura (String numero);
    void remover (String numero);
    void atualizar (ContaAbstrata conta);
    boolean existe (String numero);
}
