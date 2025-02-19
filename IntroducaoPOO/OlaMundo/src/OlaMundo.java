//UpperCamelCase - Nome de Classes
public class OlaMundo { 
    //atributos
    //lowerCamelCase - Nome de Atributos
    String nomeUsuario;

    //construtor
    public OlaMundo(String nome) {
        nomeUsuario = nome;
    }

    //métodos
    public void printText(){
        System.out.println("Olá, Mundo!!!");
    }

    public void boasVindas(){
        System.out.println("Bem Vindo "+nomeUsuario);
    }
}
