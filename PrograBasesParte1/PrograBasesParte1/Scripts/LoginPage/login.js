var lastText;

function clearTextBox(textBox)
{
    if (textBox.value == "Usuario" || textBox.value == "Contraseña") {
        lastText = textBox.value;
        textBox.value = "";
    }
};

function focusOutTextBox(textBox)
{
    if (textBox.value == "")
    {
        if (textBox.id == "MainContent_passwordsTextBox")
        {
            textBox.value = "Contraseña";
        }
        else if (textBox.id == "MainContent_usernameTextBox")
        {
            textBox.value = "Usuario";
        }
    }
};