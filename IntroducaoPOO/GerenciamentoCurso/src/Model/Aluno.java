package Model;

public class Aluno extends Pessoa{
    //atributos(encapsulamento)
    private String matricula;
    private double nota;
    //métodos
    //construtor
    public Aluno(String nome, String cpf, String matricula) {
        super(nome, cpf);
        this.matricula = matricula;
    }
    //getters and setters
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    public double getNota() {
        return nota;
    }
    public void setNota(double nota) {
        this.nota = nota;
    }
    //sobreescrita exibirInformações
    @Override
    public void exibirInformacoes(){
        super.exibirInformacoes();
        System.out.println("Matricula: "+matricula);
        System.out.println("Nota: "+nota);
    }
    

}
