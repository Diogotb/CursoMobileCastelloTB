package View;

import java.util.Scanner;

import Controller.CursoController;
import Model.Aluno;
import Model.Professor;

public class CursoView {
    // atributos
    Professor jp = new Professor("João Pereira", "123.456.789-09", 15000.00);
    CursoController cursoJava = new CursoController("Programação Java", jp);
    private int operacao;
    private boolean continuar = true;
    Scanner sc = new Scanner(System.in);

    // métodos
    public void menu() {
        while (continuar) {
            System.out.println("==Gerencimento Curso==");
            System.out.println("|1. Cadastrar Aluno ");
            System.out.println("|2. Informações do Curso");
            System.out.println("|3. Lançar Nota dos Alunos");
            System.out.println("|4. Status da Turma");
            System.out.println("|5. Sair");
            System.out.println("==Escolha Opção Desejada==");
            operacao = sc.nextInt();
            switch (operacao) {
                case 1:
                    Aluno aluno = cadastrarAluno();
                    cursoJava.adicionarAluno(aluno);
                    break;
                case 2:
                    cursoJava.exibirInformacoesCurso();
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                    System.out.println("Saindo...");
                    continuar = false;
                    break;
                default:
                    System.out.println("Informe um Opção Válida");
                    break;
            }
        }
    }

    public Aluno cadastrarAluno() {
        System.out.println("Digite o Nome do aluno");
        String nome = sc.next();
        System.out.println("Informe o CPF do Aluno");
        String cpf = sc.next();
        System.out.println("Informe a matrícula do Aluno");
        String matricula = sc.next();
        return new Aluno(nome, cpf, matricula);
    }
}
