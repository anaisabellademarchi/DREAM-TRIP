import 'package:dreamtrip/telas_de_cadastro/cadastro_de_organizador.dart';
import 'package:dreamtrip/telas_de_cadastro/cadastro_de_usuario.dart';
import 'package:dreamtrip/telas_de_consulta/home_page.dart';
import 'package:flutter/material.dart';
import 'recuperar_senha.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<Login> with TickerProviderStateMixin {
  bool _showPassword = false;
  var estadoChaveDoForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('fundo.png'), fit: BoxFit.cover),
          ),
          child: Form(
            key: estadoChaveDoForm,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('logo.png'),
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.email_sharp),
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Email inválido, digite novamente';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    labelText: "Senha",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _showPassword == false ? true : false,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Senha inválida, digite novamente!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(
                      width: 230,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const RecuperarSenha();
                        }));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 230),
                        child: Text(
                          "Recuperar senha",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color.fromARGB(255, 9, 65, 140),
                          Color.fromARGB(255, 4, 208, 208),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: SizedBox.expand(
                    child: TextButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "ENTRAR ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        if (estadoChaveDoForm.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CadastrarUsuario();
                    }));
                  },
                  child: const Text(
                    "Cadastrar como Usuário",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CadastrarOrganizador();
                    }));
                  },
                  child: const Text(
                    "Cadastrar como Organizador",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
