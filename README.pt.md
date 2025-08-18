<div align="center">
  <h1>smart-runner.nvim</h1>
  <p>
    <a href="./README.md">English</a> | <a href="./README.pt.md">Português</a>
  </p>
</div>

---

Um plugin de execução de código simples e inteligente para o Neovim, projetado para executar o arquivo atual com um único toque de tecla.

Ele detecta automaticamente o tipo de arquivo e escolhe o comando de execução correto, com suporte especial para projetos Maven e limpeza automática de artefatos compilados.

## ✨ Recursos

  * **Execução com Uma Tecla:** Execute seu código com um único mapa de teclas configurável (o padrão é `<F5>`).
  * **Detecção Automática de Linguagem:** Suporte imediato para Python, Java, C, C++, JavaScript, Go, Rust e muito mais.
  * **Suporte Inteligente para Maven:** Detecta automaticamente se um arquivo Java faz parte de um projeto Maven e executa `mvn compile exec:java` em vez do `javac` padrão.
  * **Limpeza Automática:** Remove artefatos compilados (arquivos `.class`, binários, etc.) após a execução para manter seu diretório de trabalho limpo.
  * **Altamente Configurável:** Altere facilmente o mapa de teclas ou adicione suporte para novas linguagens.

## 💾 Instalação

Recomenda-se o uso de um gerenciador de plugins moderno como o [lazy.nvim](https://github.com/folke/lazy.nvim).

### Para Usuários do Neovim (com `lazy.nvim`)

Adicione o seguinte à sua configuração de plugin do Neovim:

```lua
{
  "mikaelgois/smart-runner.nvim",
   -- 'opts' é opcional e é usado para configurar o plugin.
  opts = {},
}
```

### Para Usuários do LunarVim

Adicione o plugin à sua lista `lvim.plugins` no seu arquivo `config.lua`:

```lua
-- Em seu ~/.config/lvim/config.lua
lvim.plugins = {
  -- ... outros plugins

  {
    "mikaelgois/smart-runner.nvim",
    opts = {} 
  }
}
```

## ⚙️ Configuração (Opcional)

Você pode personalizar o plugin passando uma tabela `opts` quando você `setup` ou declarar o plugin.

**Exemplo Completo de Configuração:**

```lua
{
  "mikaelgois/smart-runner.nvim",
  opts = {
    -- Mude o mapa de teclas padrão de <F5> para <leader>r
    keymap = "<leader>r",

    -- Modifique a tabela de comandos
    commands = {
      -- Substitua um comando existente (por exemplo, use 'python' em vez de 'python3')
      py = "python %f",

      -- Adicione um novo comando para uma linguagem não suportada (por exemplo, Zig)
      zig = "zig run %f",

      -- Remove o suporte para uma linguagem definindo-a como nil
      php = nil,
    }
  }
}
```

### Placeholders de Comando

Ao definir comandos personalizados, você pode usar os seguintes placeholders:

  * `%f`: Será substituído pelo **nome do arquivo** com sua extensão (ex: `script.py`).
  * `%c`: Será substituído pelo **nome da classe** ou nome do arquivo sem extensão (ex:`HelloWorld`).
  * `%e`: Será substituído pelo **nome executável**, geralmente o nome do arquivo sem extensão (ex: `HelloWorld`).

## 🚀 Uso

1.  Abra qualquer arquivo de uma linguagem suportada.
2.  Pressione a tecla configurada (padrão é `<F5>`).
3.  Uma nova janela de terminal será dividida e seu código será executado.

## 📜 Licença

Este projeto está licenciado sob a **Licença GPL-3.0**. Consulte o arquivo `LICENSE` para mais detalhes.
