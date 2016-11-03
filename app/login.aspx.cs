﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
//Referencia do .net Data
using System.Data;

public partial class websites_login : System.Web.UI.Page
{
  // Generating a Decryptor
  CsharpCryptography Crypto = new CsharpCryptography("ETEP");

    protected void Page_Load(object sender, EventArgs e)
    {
      if(!IsPostBack){
        if(Session["log"] != null){
          Response.Redirect("home.aspx");
        }else{
          if(Session["failedLogAttempts"] == null){
            Session["failedLogAttempts"] = 0;
          }
        }
      }
    }

    protected void login(object sender, EventArgs e)
    {
       try{
        //Declarando as Variaveis
        DataView dvLogin, dvFunc;
        Session["log"] = null;
        Session["admin"] = null;

        //Getting UI Data
        string login = txtUsername.Text;
        string password = txtPassword.Text;

        string encryptedLogin = Crypto.Encrypt(login);
        string encryptedPassword = Crypto.Encrypt(password);

        //Verificando o Login
        SqlLogin.SelectParameters["LOGIN"].DefaultValue = encryptedLogin;
        SqlLogin.SelectParameters["SENHA"].DefaultValue = encryptedPassword;

        dvLogin = (DataView)SqlLogin.Select(DataSourceSelectArguments.Empty);

        //Verificando o Usuário
        if (dvLogin.Table.Rows.Count > 0){
            //Carregando log com o id do Funcionario
            Session["log"] = Convert.ToInt32((dvLogin.Table.Rows[0]["id_func"]).ToString());
            //Obtendo Funcionario
            dvFunc = (DataView)SqlFunc.Select(DataSourceSelectArguments.Empty);

            // Verificando se é Administrador
            if (Convert.ToInt32((dvFunc.Table.Rows[0]["id_cargo"]).ToString()) == 1){
              Session["admin"] = "true";
            }
            else{
              Session["admin"] = null;
            }
            //Guardando o id do Funcionario
            Session["log"] = dvFunc.Table.Rows[0]["id_func"].ToString();
            Response.Redirect("~/app/home.aspx");

            // AUDITORIA
            // Gravando Ação no `userlog`
            string curretUser = Session["log"].ToString();
            string acao = "Seção Iniciada";
            // Transformando a data no padrão internacional
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            userLog.InsertParameters["funcionario"].DefaultValue = Crypto.Encrypt(curretUser);
            userLog.InsertParameters["acao"].DefaultValue = Crypto.Encrypt(acao);
            userLog.InsertParameters["time"].DefaultValue = Crypto.Encrypt(currentDate);

            // Inserindo as informações
            userLog.Insert();
        }
        //Falha na Autênticação
        else{
          //Limpando os campos
          txtUsername.Text = String.Empty;
          txtPassword.Text = String.Empty;
          Response.Write("<script>alert('Login ou senha incorretos!');</script>");

          // Adicionando uma tentativa na session logAttempt
          if (Session["failedLogAttempts"] != null) {
            int failedAttempts = Convert.ToInt32(Session["failedLogAttempts"].ToString());
            string jsFailed = failedAttempts.ToString();
            Session["failedLogAttempts"] = failedAttempts + 1;
          }else{
            // Adicionando a primeira falha
            Session["failedLogAttempts"] = 1;
          }
        }
      }
      catch(Exception ex){
        // ERRO NA CONEXÃO COM O BANCO DE DADOS
        Response.Write("<script>function dbError() {if (confirm('Ocorreu um erro no banco de dados interno. Você pode detalhar o erro para nossos desenvolvedores?')) {window.open('mailto:ioetep@gmail.com?subject=Erro+no+Banco+de+Dados&body=Por+favor+detalhe+o+que+estava+fazendo+ao+se+deparar+com+o+erro');}else{alert('Uma menssagem de erro genérica foi enviada ao Desenvolvedor');}} dbError();</script>");
      }
    }
}
