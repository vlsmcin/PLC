public class Adulto extends Pessoa {
    @Override
    public Ticket getTicketType() {
        return Ticket.ADULTO;
    }

    public Adulto(Integer idade, String nome) {
        super(idade, nome);
    }
}
