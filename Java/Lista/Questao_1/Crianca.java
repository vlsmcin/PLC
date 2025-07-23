public class Crianca extends Pessoa {
    @Override
    public Ticket getTicketType() {
        return Ticket.CRIANCA;
    }

    public Crianca(Integer idade, String nome) {
        super(idade, nome);
    }
}
